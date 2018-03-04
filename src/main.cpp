
#include <Arduino.h>
#include "config.h"
#include "SensorNode.h"
#include "Timing.h"


SensorNode Nodes[] = {SENSOR_1_PIN, SENSOR_2_PIN, SENSOR_3_PIN, SENSOR_4_PIN};

#define INTERRUPT_CHANGE_FUNCTION(Pin, ID) \
{ \
u_int32_t Now = CURRENT_TIME; \
    if (digitalReadFast(Pin)) \
        {Nodes[ID].RisingEdge(Now); \
    }\
    else { \
        Nodes[ID].FallingEdge(Now);\
}\
}

void Interrupt0Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PIN, 0);

void Interrupt1Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_2_PIN, 1);

void Interrupt2Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_3_PIN, 2);

void Interrupt3Change() INTERRUPT_CHANGE_FUNCTION(SENSOR_4_PIN, 3);


void ConfigureInterrupts() {
    Serial.print("Init Interrupts - ");
    attachInterrupt(Nodes[0].GetPin(), Interrupt0Change, CHANGE);
    attachInterrupt(Nodes[1].GetPin(), Interrupt1Change, CHANGE);
    attachInterrupt(Nodes[2].GetPin(), Interrupt2Change, CHANGE);
    attachInterrupt(Nodes[3].GetPin(), Interrupt3Change, CHANGE);
    Serial.println("Complete");
}

//char (*__kaboom)[sizeof(float16_t)] = 1;
u_int32_t LastSyncPulseTime = 0;
u_int32_t SweepSyncStartTime = 0;
u_int8_t NextSweepSource = 0;
u_int8_t NextSweepAxis = 0;

void Setup() {
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


void Loop() {
    Pulse *EarliestSyncDetectedSource = NULL;
    u_int32_t EarlyTrack = 0;
    u_int32_t BaseTime = CURRENT_TIME;
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        if (Nodes[i].NeedsPulseHandling()) {
            Pulse *NewPulse = Nodes[i].PulseHandler();
            if (NewPulse->IsSyncPulse) {
                if (BaseTime - NewPulse->RisingEdgeTicks > EarlyTrack) {
                    EarlyTrack = BaseTime - NewPulse->RisingEdgeTicks;
                    EarliestSyncDetectedSource = NewPulse;

                }
                NewPulse->ReadOut = true;
            }
        }
    }


    if (EarliestSyncDetectedSource != NULL) {
        //Pulse *PulsePointer = &Nodes[EarliestSyncDetectedSource].Waveform[Nodes[EarliestSyncDetectedSource].LastProcessPointer()];//.LastProcessPointer();
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
                         LastSyncPulseTime, PULSETRAIN_SYNC_DISCREPANCY)) {

            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
                    EarliestSyncDetectedSource->PulseDurationTicks);
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
                                              EarliestSyncDetectedSource->RisingEdgeTicks -
                                              LastSyncPulseTime,
                                              TICKS_BETWEEN_SYNC_PULSES + PULSETRAIN_SYNC_DISCREPANCY);
            LastSyncPulseTime = EarliestSyncDetectedSource->RisingEdgeTicks;
            if (!SKIP(SyncPulseMeaning)) {
                NextSweepSource = SourceStation;
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks;
                NextSweepAxis = AXIS(SyncPulseMeaning);
            }

//
//                Serial.print("SYNC at: ");
//                Serial.print(TICKS_TO_US(CURRENT_TIME));
//                Serial.print(" Node:");
//                Serial.print(EarliestSyncDetectedSource);
//                Serial.print(" Base:");
//                Serial.print(SourceStation);
//                Serial.print(" NextSweepSource:");
//                Serial.print(NextSweepSource);
//                Serial.print(" NextSweepAxis:");
//                Serial.print(NextSweepAxis);
        }
    }


    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(NextSweepSource, NextSweepAxis, SweepSyncStartTime);
    }

}


int main() {
    Setup();
    while (true) {
        Loop();
    }
    return 0;
}