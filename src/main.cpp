
#include <Arduino.h>
#include "pins.h"
#include "config.h"
#include "SensorNode.h"
#include "Timing.h"
#include "OOTX.h"

SensorNode Nodes[] = {SENSOR_1_PINS};
BaseOOTX OOTX[2] = {STATION_A, STATION_B};

void NewSyncInterrupt(u_int8_t SourceNode, u_int32_t PulseLength, u_int32_t PulseStartTime);

bool In_ISR = false;
#define INTERRUPT_CHANGE_FUNCTION(ID){\
    u_int32_t Now = CURRENT_TIME;\
    interrupts();\
    if (In_ISR){Serial.println("INISR");}\
    In_ISR = true;\
    static u_int32_t LastCallTime = 0;\
    u_int32_t LastCallToNow = Now-LastCallTime;\
    LastCallTime = Now;\
    if (IN_RANGE(SYNC_PULSE_LENGTH_TICKS_MIN,LastCallToNow,SYNC_PULSE_LENGTH_TICKS_MAX)){\
        NewSyncInterrupt(ID,LastCallToNow,Now);\
            }\
    else if (IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,LastCallToNow,SWEEP_PULSE_LENGTH_TICKS_MAX)){\
        Nodes[ID].NewSweepInterrupt(LastCallToNow,Now);\
    }\
    In_ISR = false;\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);


void ConfigureInterrupts() {
    Serial.print("Init Interrupts - ");
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
    Serial.println("Complete");
}

//char (*__kaboom)[sizeof(SensorNode)] = 1;


void MainSetup() {
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
    }
    delay(100);

    InitTimer(); //Start up better timer (If using)
    ConfigureInterrupts(); // Set up Channel Interrupts
    digitalWriteFast(LED_BUILTIN, HIGH);
}


Pulse LatestBaseSync[2];

void NewSyncInterrupt(u_int8_t SourceNode, u_int32_t PulseLength, u_int32_t PulseStartTime) {
    static Pulse LastDetectedSync = {0, 0};
    if (!IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime,
                  PULSETRAIN_SYNC_DISCREPANCY)) { // New Sync Pulse? (multiple nodes feed same function)
        u_int8_t SourceStation = IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime, US_TO_TICKS(1000));
        LastDetectedSync.StartTime = LatestBaseSync[SourceStation].StartTime = PulseStartTime;
        LastDetectedSync.Length = LatestBaseSync[SourceStation].Length = PulseLength;
        LatestBaseSync[SourceStation].New = true;
    }
}


void MainLoop() {
    static u_int8_t NextSweepSource = 0;
    static u_int8_t NextSweepAxis = 0;
    static u_int8_t CurrentStationLock = 0;
    static u_int32_t SyncSweepStartTime = 0;

    u_int32_t RunStartTime = CURRENT_TIME;

    if (LatestBaseSync[STATION_A].New) {
        noInterrupts();
        Pulse SafeCopy = LatestBaseSync[STATION_A];
        LatestBaseSync[STATION_A].New = false;
        interrupts();
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
        SyncSweepStartTime = SafeCopy.StartTime;
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_A;
        NextSweepAxis = AXIS(SyncPulseMeaning);
    }

    if (LatestBaseSync[STATION_B].New) {
        noInterrupts();
        Pulse SafeCopy = LatestBaseSync[STATION_B];
        LatestBaseSync[STATION_B].New = false;
        interrupts();
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_B;
        NextSweepAxis = AXIS(SyncPulseMeaning);
        SyncSweepStartTime = SafeCopy.StartTime;
    }


    bool HadRecentSyncA = (RunStartTime - LatestBaseSync[STATION_A].StartTime) >= 2 * PULSETRAIN_LENGTH_TICKS;
    bool HadRecentSyncB = (RunStartTime - LatestBaseSync[STATION_B].StartTime) >= 2 * PULSETRAIN_LENGTH_TICKS;
    CurrentStationLock = HadRecentSyncA + HadRecentSyncB;

    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(RunStartTime, NextSweepSource, NextSweepAxis, SyncSweepStartTime,
                                     CurrentStationLock);
    }

    static unsigned long t = 0;
    if (millis() - t > 100) {
        t = millis();
        Nodes[0].PrepareForReading();
        Serial.print(CurrentStationLock);
        Serial.print("  A: ");
        Serial.print((Nodes[0].Angles[STATION_A][HORZ]));
        Serial.print(" ");
        Serial.print((Nodes[0].Angles[STATION_A][VERT]));
        Serial.print(" ");
        Serial.print((Nodes[0].Angles[STATION_B][HORZ]));
        Serial.print(" ");
        Serial.print((Nodes[0].Angles[STATION_B][VERT]));
        Serial.println(" ");
        //OOTX[STATION_A].PrintBuffer();


    }

}

int main() {
    MainSetup();
    delay(200);
    while (true) {
        MainLoop();
        yield(); // Critical for interrupts. For some reason. TODO Investigate.
    }
    return 0;
}