
#include <Arduino.h>
#include "pins.h"
#include "config.h"
#include "SensorNode.h"
#include "Timing.h"

SensorNode Nodes[] = {SENSOR_1_PINS};

void NewSyncPinInterrupt(u_int8_t SourceNode, u_int32_t PulseLength, u_int32_t PulseStartTime);


#define INTERRUPT_CHANGE_FUNCTION(ID){\
    u_int32_t Now = CURRENT_TIME;\
    interrupts();\
    static u_int32_t LastCallTime = 0;\
    u_int32_t LastCallToNow = Now-LastCallTime;\
    if (!IN_RANGE(0,LastCallToNow,PULSETRAIN_SYNC_DISCREPANCY)){/*NEW WILL BET THIS WAS THE CAUSE OF THE NOISE ERROR*/ \
        LastCallTime = Now;\
        if (IN_RANGE(SYNC_PULSE_LENGTH_TICKS_MIN,LastCallToNow,SYNC_PULSE_LENGTH_TICKS_MAX)){\
            NewSyncPinInterrupt(ID,LastCallToNow,Now);\
                }\
        else if (IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,LastCallToNow,SWEEP_PULSE_LENGTH_TICKS_MAX)){\
            Nodes[ID].NewSweepPinInterrupt(LastCallToNow,Now);\
        }\
    }\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(0);


void ConfigurePinInterrupts() {
    Serial.print("Init Interrupts - ");
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
    Serial.println("Complete");
}

//char (*__kaboom)[US_TO_TICKS(8333)/(1000 * (2^16))] = 1;


void MainSetup() {
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);
    delay(2000);
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { // Init Sensor Channels
        Nodes[i].Init();
    }
    delay(100);

    InitTimer(); //Start up better timer (If using)
    ConfigurePinInterrupts(); // Set up Channel Interrupts
    digitalWriteFast(LED_BUILTIN, HIGH);
}


Pulse LatestHardwareBaseSync[2];

//
void NewSyncPinInterrupt(u_int8_t SourceNode, u_int32_t PulseLength, u_int32_t PulseStartTime) {
    static Pulse LastDetectedSync = {0, 0};
    if (!IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime,
                  PULSETRAIN_SYNC_DISCREPANCY)) { // New Sync Pulse? (multiple nodes feed same function)
        u_int8_t SourceStation = IN_RANGE(0, PulseStartTime - LastDetectedSync.StartTime, US_TO_TICKS(1000));

        LastDetectedSync.StartTime = LatestHardwareBaseSync[SourceStation].StartTime = PulseStartTime;
        LastDetectedSync.Length = LatestHardwareBaseSync[SourceStation].Length = PulseLength;
        LatestHardwareBaseSync[SourceStation].New = true;
    }
}


void MainLoop() {
    static u_int8_t NextSweepSource = 0;
    static u_int8_t NextSweepAxis = 0;
    static u_int8_t CurrentHardwareStationLock = 0;
    static u_int32_t SyncSweepStartTime = 0;

    u_int32_t RunStartTime = CURRENT_TIME;

    if (LatestHardwareBaseSync[STATION_A].New) {
        noInterrupts();
        Pulse SafeCopy = LatestHardwareBaseSync[STATION_A];
        LatestHardwareBaseSync[STATION_A].New = false;
        interrupts();
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
        SyncSweepStartTime = SafeCopy.StartTime;
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_A;
        NextSweepAxis = AXIS(SyncPulseMeaning);
    }

    if (LatestHardwareBaseSync[STATION_B].New) {
        noInterrupts();
        Pulse SafeCopy = LatestHardwareBaseSync[STATION_B];
        LatestHardwareBaseSync[STATION_B].New = false;
        interrupts();
        u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(SafeCopy.Length);
        NextSweepSource = SKIP(SyncPulseMeaning) ? NextSweepSource : STATION_B;
        NextSweepAxis = AXIS(SyncPulseMeaning);
        SyncSweepStartTime = SafeCopy.StartTime;
    }


    bool HadRecentHardwareSyncA =
            (RunStartTime - LatestHardwareBaseSync[STATION_A].StartTime) >= 1 * PULSETRAIN_LENGTH_TICKS;
    bool HadRecentHardwareSyncB =
            (RunStartTime - LatestHardwareBaseSync[STATION_B].StartTime) >= 1 * PULSETRAIN_LENGTH_TICKS;
    CurrentHardwareStationLock = HadRecentHardwareSyncA + HadRecentHardwareSyncB;

    if (CurrentHardwareStationLock == DUAL_STATION_LOCK) {

        PhaseLockTimeLock(LatestHardwareBaseSync[STATION_A].StartTime, LatestHardwareBaseSync[STATION_B].StartTime);
        //PhaseLockPhaseLock(LatestHardwareBaseSync[STATION_A].StartTime, LatestHardwareBaseSync[STATION_B].StartTime);
    }
//    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
//        Nodes[i].CheckAndHandleSweep(RunStartTime, NextSweepSource, NextSweepAxis, SyncSweepStartTime,
//                                     CurrentHardwareStationLock);
//    }
//
//    static unsigned long t = 0;
//    if (millis() - t > 100) {
//        t = millis();
//        Nodes[0].PrepareForReading();
//        Serial.print(CurrentHardwareStationLock);
//        Serial.print("  A: ");
//        Serial.print((Nodes[0].Angles[STATION_A][HORZ]));
//        Serial.print(" ");
//        Serial.print((Nodes[0].Angles[STATION_A][VERT]));
//        Serial.print(" ");
//        Serial.print((Nodes[0].Angles[STATION_B][HORZ]));
//        Serial.print(" ");
//        Serial.print((Nodes[0].Angles[STATION_B][VERT]));
//        Serial.println(" ");
//        //OOTX[STATION_A].PrintBuffer();
//
//
//    }

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