//
// Created by Sam Lane on 10/02/2018.
//

#include "SensorNode.h"
#include "config.h"


void SensorNode::SetLEDState(int LEDState) {
    static int CurrentLEDState = LED_OFF;
    if (LEDState != CurrentLEDState) {
        switch (LEDState) {
            case LED_OFF:
                pinMode(_PinData.LED1Pin, INPUT);
                pinMode(_PinData.LED2Pin, INPUT);
                digitalWrite(_PinData.LED1Pin, LOW);
                digitalWrite(_PinData.LED2Pin, LOW);
                break;
            case LED_RED:
                pinMode(_PinData.LED1Pin, OUTPUT);
                pinMode(_PinData.LED2Pin, INPUT);
                digitalWrite(_PinData.LED1Pin, LOW);
                digitalWrite(_PinData.LED2Pin, LOW);
                break;
            case LED_RED_YELLOW:
                pinMode(_PinData.LED1Pin, OUTPUT);
                pinMode(_PinData.LED2Pin, OUTPUT);
                digitalWrite(_PinData.LED1Pin, HIGH);
                digitalWrite(_PinData.LED2Pin, LOW);
                break;
            case LED_GREEN:
                pinMode(_PinData.LED1Pin, INPUT);
                pinMode(_PinData.LED2Pin, OUTPUT);
                digitalWrite(_PinData.LED1Pin, LOW);
                digitalWrite(_PinData.LED2Pin, HIGH);
                break;
            case LED_RED_GREEN:
                pinMode(_PinData.LED1Pin, OUTPUT);
                pinMode(_PinData.LED2Pin, OUTPUT);
                digitalWrite(_PinData.LED1Pin, LOW);
                digitalWrite(_PinData.LED2Pin, HIGH);
                break;
        }
        CurrentLEDState = LEDState;
    }
}

SensorNode::SensorNode(SensorPinData_t PinData) {
    _PinData = PinData;

}


void SensorNode::Init() {
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
    pinMode(_PinData.LED2Pin, INPUT);
    Angles[STATION_A][HORZ] = 0;
    Angles[STATION_A][VERT] = 0;
    Angles[STATION_B][HORZ] = 0;
    Angles[STATION_B][VERT] = 0;
    Location[X_AXIS] = 0;
    Location[Y_AXIS] = 0;
    Location[Z_AXIS] = 0;

    Serial.println(" Complete");
}

SensorNode::~SensorNode() {

}

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}

void SensorNode::NewSweepInterrupt(u_int32_t PulseLength, u_int32_t PulseStartTime) {
    LatestSweepInterrupt.Length = PulseLength;
    LatestSweepInterrupt.StartTime = PulseStartTime;
    LatestSweepInterrupt.New = true;
}

bool SensorNode::CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                                     u_int8_t CurrentStationLock, Pulse *Temp) {
    noInterrupts();
    Pulse SafeCopy = LatestSweepInterrupt;
    LatestSweepInterrupt.New = false;
    interrupts();
    if (SafeCopy.New) {
        if (CurrentStationLock == DUAL_STATION_LOCK) {
            float NewAngle = TICKS_TO_RADIANS(SafeCopy.StartTime - SweepStartTime);
            Angles[SweepSource][SweepAxis] = NewAngle;
            Serial.print(CurrentStationLock);
            Serial.print("  A: ");
            Serial.print(RAD_TO_DEG * (Angles[STATION_A][HORZ]));
            Serial.print(" ");
            Serial.print(RAD_TO_DEG * (Angles[STATION_A][VERT]));
            Serial.print(" ");
            Serial.print(RAD_TO_DEG * (Angles[STATION_B][HORZ]));
            Serial.print(" ");
            Serial.print(RAD_TO_DEG * (Angles[STATION_B][VERT]));
            Serial.println(" ");
            Serial.println(TICKS_TO_US(SafeCopy.StartTime));
            Serial.println(TICKS_TO_US(SafeCopy.Length));
            Serial.println(TICKS_TO_US(Temp->StartTime));
            Serial.println(TICKS_TO_US(Temp->Length));

            Serial.println(" ");

        }
        else if (CurrentStationLock == SINGLE_STATION_LOCK) {
            float NewAngle = TICKS_TO_RADIANS(SafeCopy.StartTime - SweepStartTime);
            if (IN_RANGE(-UNCERTAIN_ANGLE_THRESHOLD, NewAngle - Angles[SweepSource][SweepAxis],
                         UNCERTAIN_ANGLE_THRESHOLD)) {
                //Angles[SweepSource][SweepAxis] = NewAngle;
            }
        }
//        Serial.println(NewAngle);
//        Serial.println(" ");
    }
}
//    Pulse *LastPulse = &Waveform[LastProcessPointer()];
//    if (LastPulse->Valid and not LastPulse->ReadOut) { //Is this pulse new, and valid?
//        if (LastPulse->IsCertainSweepPulse and CurrentStationLock ==
//                                               DUAL_STATION_LOCK) { // Are we certain its a sweep pulse? And do we have a certain dual lock.
//            LastPulse->ReadOut = true;
//            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
//            if (IN_RANGE(0, NewAngle, TWO_PI)) {
//                Angles[SweepSource][SweepAxis] = NewAngle;
//                return true;
//            }
////            Serial.print("Certain Sweep-");
////            Serial.print(SweepSource);
////            Serial.print(" - ");
////            Serial.println(SweepAxis);
//        }
//        else if (LastPulse->IsUncertainShortPulse) { //We are not certain its a sweep, but its too short to accurately measure its width... Might be noise, might be a sweep. Might also be from another base.
//            LastPulse->ReadOut = true;
//            float NewAngle = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
//            if (IN_RANGE(0, NewAngle, TWO_PI)) {
//                if (IN_RANGE(DEGREES_TO_RADIANS(-UNCERTAIN_ANGLE_THRESHOLD), NewAngle - Angles[SweepSource][SweepAxis],
//                             DEGREES_TO_RADIANS(UNCERTAIN_ANGLE_THRESHOLD))) {
//                   // Angles[SweepSource][SweepAxis] = NewAngle;
//                }
//                return true;
//            }
//        }
//    }
//    return false;
//}