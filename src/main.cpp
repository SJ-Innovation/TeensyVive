
#include <Arduino.h>
#include "pins.h"
#include "config.h"
#include "SensorNode.h"
#include "Timing.h"
#include "OOTX.h"

BaseOOTX OOTX[2] = {STATION_A, STATION_B};

SensorNode Nodes[] = {SENSOR_1_PINS};

#define INTERRUPT_CHANGE_FUNCTION(Pin, ID) \
    static uint_fast8_t ConsecRise=0;\
static uint_fast8_t ConsecFall=0;\
u_int32_t Now = CURRENT_TIME;\
uint_fast8_t State = digitalReadFast(Pin);\
if (State){\
ConsecRise++;\
Nodes[ID].RisingEdge(Now,ConsecRise,ConsecFall);\
ConsecFall=0;\
}\
else{\
ConsecFall++;\
Nodes[ID].FallingEdge(Now,ConsecRise,ConsecFall);\
ConsecRise = 0;\
}\
}


void Interrupt0Change() {
INTERRUPT_CHANGE_FUNCTION(SENSOR_1_PINS.PulsePin, 0);

void ConfigureInterrupts() {
    Serial.print("Init Interrupts - ");
    attachInterrupt(Nodes[0].GetPulsePin(), Interrupt0Change, CHANGE);
    // attachInterrupt(Nodes[1].GetPulsePin(), Interrupt1Change, CHANGE);
    //attachInterrupt(Nodes[2].GetPulsePin(), Interrupt2Change, CHANGE);
    //attachInterrupt(Nodes[3].GetPulsePin(), Interrupt3Change, CHANGE);
    Serial.println("Complete");
}

//char (*__kaboom)[VERT] = 1;


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


void MainLoop() {
    static u_int8_t LastSyncSource = 0;
    static u_int32_t LastSyncPulseTime = 0;
    static u_int32_t SweepSyncStartTime = 0;
    static u_int8_t NextSweepSource = 0;
    static u_int8_t NextSweepAxis = 0;
    static u_int8_t CurrentStationLock = NO_STATION_LOCK;
    static bool LastOOTXBit = 0;

    Pulse *EarliestSyncDetectedSource = NULL;
    u_int32_t EarlyTrack = 0;
    u_int32_t BaseTime = CURRENT_TIME;
    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) { //Look through all nodes
        if (Nodes[i].NeedsPulseHandling()) { //Perform pulse calc pump only if needed
            Pulse *NewPulse = Nodes[i].PulseHandler(); //Update the oldest, non updated pulse

            if (NewPulse->IsCertainSyncPulse and not NewPulse->ReadOut) { //Is that pulse a new sync pulse?
                if (BaseTime - NewPulse->RisingEdgeTicks >
                    EarlyTrack) { //Have we already detected a potential sync pulse, if so, is this one older (therefore happened earlier so should be trusted more)
                    EarlyTrack = BaseTime -
                                 NewPulse->RisingEdgeTicks; //It is earlier, so this is the sync pulse we need to go with
                    EarliestSyncDetectedSource = NewPulse;

                }
                NewPulse->ReadOut = true; //This pulse is read out, so doesnt need to be accessed again.
                //    Serial.println("Sync:");
            }

        }
    }


    if (EarliestSyncDetectedSource != NULL) { // Have we detected a potentially new sync pulse?
        if (!IN_RANGE(0, EarliestSyncDetectedSource->RisingEdgeTicks -
                         LastSyncPulseTime,
                      PULSETRAIN_SYNC_DISCREPANCY)) { // Is this sync pulse definitely unique, as in its not been detected by another node already?

            u_int8_t SyncPulseMeaning = SYNC_PULSE_MEANING(
                    EarliestSyncDetectedSource->PulseDurationTicks);
            u_int8_t SourceStation = IN_RANGE(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY,
                                              EarliestSyncDetectedSource->RisingEdgeTicks -
                                              LastSyncPulseTime,
                                              TICKS_BETWEEN_SYNC_PULSES +
                                              PULSETRAIN_SYNC_DISCREPANCY); //Which station did this sync come from? Is this a first or second sync pulse?
            if (LastSyncSource == STATION_A and SourceStation ==
                                                STATION_B) { //Was the last sync pulse from A, and the other from B? If so we have a double lock, same for both we have single lock.
                CurrentStationLock = DUAL_STATION_LOCK;
                OOTX[STATION_A].NewOOTXBit(LastOOTXBit);
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
            }
            else {
                CurrentStationLock = SINGLE_STATION_LOCK; //Not sure which station though.
                OOTX[STATION_A].NewOOTXBit(
                        DATA(SyncPulseMeaning)); //Worth a shot, its an invalid frame anyway if it misses one. This way it might get lucky.
                OOTX[STATION_B].NewOOTXBit(DATA(SyncPulseMeaning));
            }
            if (!SKIP(SyncPulseMeaning)) { //Is the station this sync concerns laser sweeping this time?
                NextSweepSource = SourceStation; // Expect the next sweep to be from this base
                SweepSyncStartTime = EarliestSyncDetectedSource->RisingEdgeTicks; //Used for determining if first or second pulse
                NextSweepAxis = AXIS(SyncPulseMeaning); // Which axis will this station be broadcasting.

            }
            // Serial.print( TICKS_TO_US(TICKS_BETWEEN_SYNC_PULSES - PULSETRAIN_SYNC_DISCREPANCY));
            //   Serial.print(" ");
            //   Serial.print( TICKS_TO_US(TICKS_BETWEEN_SYNC_PULSES + PULSETRAIN_SYNC_DISCREPANCY));
//            Serial.print("SYNC at: ");
//            Serial.print(TICKS_TO_US(CURRENT_TIME));
//            Serial.print(" TSinceLast:");
//            Serial.print(TICKS_TO_US((EarliestSyncDetectedSource->RisingEdgeTicks-LastSyncPulseTime)));
//            Serial.print(" Length:");
//            Serial.print(TICKS_TO_US(EarliestSyncDetectedSource->PulseDurationTicks));
//            Serial.print(" Base:");
//            Serial.print(SourceStation);
//            Serial.print(" NextSweepSource:");
//            Serial.print(NextSweepSource);
//            Serial.print(" NextSweepAxis:");
//            Serial.println(NextSweepAxis);
            LastSyncSource = SourceStation;
            LastOOTXBit = DATA(SyncPulseMeaning);
            LastSyncPulseTime = EarliestSyncDetectedSource->RisingEdgeTicks;
        }
        //

    }
    else { //EarlyDetectionSource == NULL
        if (BaseTime - LastSyncPulseTime >
            2 * PULSETRAIN_LENGTH_TICKS) { //If no sync pulse in the length of a full cycle. We have no station lock.
            CurrentStationLock = NO_STATION_LOCK;
        }
    }


    for (u_int8_t i = 0; i < sizeof(Nodes) / sizeof(SensorNode); i++) {
        Nodes[i].CheckAndHandleSweep(NextSweepSource, NextSweepAxis, SweepSyncStartTime, CurrentStationLock);
    }

    static unsigned long t = 0;
    if (millis() - t > 1000) {
        t = millis();
        //OOTX[STATION_A].PrintBuffer();
        // Serial.println(CurrentStationLock);
//        Serial.print("  A: ");
//        Serial.print(RAD_TO_DEG * (Nodes[0].Angles[STATION_A][HORZ]));
//        Serial.print(" ");
//        Serial.print(RAD_TO_DEG * (Nodes[0].Angles[STATION_A][VERT]));
//        Serial.print(" ");
//        Serial.print(RAD_TO_DEG * (Nodes[0].Angles[STATION_B][HORZ]));
//        Serial.print(" ");
//        Serial.println(RAD_TO_DEG * (Nodes[0].Angles[STATION_B][VERT]));

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


int main() {
    MainSetup();
    delay(200);


    while (true) {
//        for (int i = 0; i <= LED_RED_GREEN; i++) {
//            Nodes[0].SetLEDState(LED_RED_GREEN);
//            Serial.println(i);
//            delay(250);
//        }
//
//    }

        MainLoop();
    }
    return 0;
}