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


void SensorNode::MovingAverageAdd(float New, u_int8_t Source, u_int8_t Axis) {
    AverageAngle[Source][Axis][AverageAnglePointers[Source][Axis]] = New;
    ++AverageAnglePointers[Source][Axis] %= AVERAGE_SIZE;

}

float SensorNode::MovingAverageCalc(u_int8_t Source, u_int8_t Axis) {
    float Min=360,Max=0;
    for (int i = 0; i < AVERAGE_SIZE; i++){
        float This = AverageAngle[Source][Axis][i];
        Min = min(Min,This);
        Max = max(Max,This);
    }
//    Serial.print(Min);
//    Serial.print("  ");
//    Serial.println(Max);
    float Total = 0;
    for (int i = 0; i < AVERAGE_SIZE; i++) {
        float This = AverageAngle[Source][Axis][i];

//        Serial.print(This);
//        Serial.print(" - ");
        Total += This;
    }
   // Serial.println(" ");


    return Total / (float) AVERAGE_SIZE;


}

void SensorNode::PrepareForReading() {
    Angles[STATION_A][HORZ] = MovingAverageCalc(STATION_A, HORZ);
    Angles[STATION_A][VERT] = MovingAverageCalc(STATION_A, VERT);
    Angles[STATION_B][HORZ] = MovingAverageCalc(STATION_B, HORZ);
    Angles[STATION_B][VERT] = MovingAverageCalc(STATION_B, VERT);

}

bool SensorNode::CheckAndHandleSweep(u_int32_t Now, u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                                     u_int8_t CurrentStationLock) {
    noInterrupts();
    Pulse SafeCopy = LatestSweepInterrupt;
    LatestSweepInterrupt.New = false;
    interrupts();
    if (SafeCopy.New) {
        if (CurrentStationLock == DUAL_STATION_LOCK) {
            float NewAngle = TICKS_TO_DEGREES(SafeCopy.StartTime - SweepStartTime);
            //Angles[SweepSource][SweepAxis] = NewAngle;
            MovingAverageAdd(NewAngle, SweepSource, SweepAxis);
            return true;
        }
    }
}
