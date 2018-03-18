//
// Created by Sam Lane on 10/02/2018.
//

#include "SensorNode.h"
#include "config.h"


void SensorNode::SetLEDState(int LEDState) {
    static int CurrentLEDState = LED_OFF;
    if (LEDState != CurrentLEDState) {
        Serial.println("Set");
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

bool SensorNode::NeedsPulseHandling() {
    return !(ProcessPointer == LastWaveformPointer());
}

void SensorNode::IncWaveformPointer() {
    (++WaveformPointer) %= WAVEFORM_SIZE;
}

void SensorNode::DecWaveformPointer() {
    if (WaveformPointer == 0) { WaveformPointer = WAVEFORM_SIZE - 1; }
    (--WaveformPointer) %= WAVEFORM_SIZE;
}

int8_t SensorNode::NextWaveformPointer() {
    return (WaveformPointer + 1) % WAVEFORM_SIZE;
}

int8_t SensorNode::LastWaveformPointer() {
    //  if (WaveformPointer == 0) { return WAVEFORM_SIZE - 1; }
    return (WaveformPointer - 1) % WAVEFORM_SIZE;
}

void SensorNode::IncProcessPointer() {
    (++ProcessPointer) %= WAVEFORM_SIZE;
}

void SensorNode::DecProcessPointer() {
    //  if (ProcessPointer == 0) { ProcessPointer = WAVEFORM_SIZE - 1; }
    (--ProcessPointer) %= WAVEFORM_SIZE;
}

int8_t SensorNode::NextProcessPointer() {
    return (ProcessPointer + 1) % WAVEFORM_SIZE;
}

int8_t SensorNode::LastProcessPointer() {
    if (ProcessPointer == 0) { return WAVEFORM_SIZE - 1; }
    return (ProcessPointer - 1) % WAVEFORM_SIZE;
}

int8_t SensorNode::ProcessPointerOffset(int8_t Offset) {
    return (ProcessPointer + Offset) % WAVEFORM_SIZE;
}

void SensorNode::Init() {
    Serial.print("Sensor On Pin ");
    Serial.print(_PinData.PulsePin);
    pinMode(_PinData.PulsePin, INPUT);
    pinMode(_PinData.LED1Pin, INPUT); //For tristate.
    pinMode(_PinData.LED2Pin, INPUT);
    WaveformPointer = 1;
    ProcessPointer = 0;
    Angles[STATION_A][HORZ] = 0;
    Angles[STATION_A][VERT] = 0;
    Angles[STATION_B][HORZ] = 0;
    Angles[STATION_B][VERT] = 0;
    for (int i = 0; i < WAVEFORM_SIZE; i++) {
        Waveform[i].PulseDurationTicks = 0;
        Waveform[i].RisingEdgeTicks = 0;
        //Waveform[i].LastPulseToThisPulseTicks = 0;
        Waveform[i].FallingEdgeTicks = 0;
    }
    Serial.println(" Complete");
}

SensorNode::~SensorNode() {

}

u_int8_t SensorNode::GetPulsePin() {
    return _PinData.PulsePin;
}

void SensorNode::RisingEdge(u_int32_t TimeTicks) {
    IncWaveformPointer();
    Waveform[WaveformPointer].Valid = false;
    Waveform[WaveformPointer].RisingEdgeTicks = TimeTicks;
}

void SensorNode::FallingEdge(u_int32_t TimeTicks) {
    Waveform[WaveformPointer].FallingEdgeTicks = TimeTicks;
    Waveform[WaveformPointer].Valid = false;

}

Pulse *SensorNode::PulseHandler() {
    Pulse *LatestPulse = &Waveform[ProcessPointer];
    if (LatestPulse->RisingEdgeTicks >
        LatestPulse->FallingEdgeTicks) { // If theyre reversed (weird Interrupt behaviour)
        LatestPulse->PulseDurationTicks = 0;
        LatestPulse->IsUncertainShortPulse = true;
    }
    else {
        LatestPulse->IsUncertainShortPulse = false;
        LatestPulse->PulseDurationTicks =
                LatestPulse->FallingEdgeTicks - LatestPulse->RisingEdgeTicks;
        LatestPulse->IsCertainSyncPulse = (bool) IN_RANGE(FLASH_PULSE_LENGTH_TICKS_MIN,
                                                          LatestPulse->PulseDurationTicks,
                                                          FLASH_PULSE_LENGTH_TICKS_MAX);
        LatestPulse->IsCertainSweepPulse = (bool) IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,
                                                           LatestPulse->PulseDurationTicks,
                                                           SWEEP_PULSE_LENGTH_TICKS_MAX);
    }
    LatestPulse->Valid = true;
    LatestPulse->ReadOut = false;
    IncProcessPointer();
    return LatestPulse;
}

u_int32_t PulseAge(Pulse &TestPulse) {
    return CURRENT_TIME - TestPulse.RisingEdgeTicks;
}

void SensorNode::CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                                     u_int8_t CurrentStationLock) {
    Pulse *LastPulse = &Waveform[LastProcessPointer()];
    if (LastPulse->Valid and not LastPulse->ReadOut) { //Is this pulse new, and valid?
        if (LastPulse->IsCertainSweepPulse and CurrentStationLock ==
                                               DUAL_STATION_LOCK) { // Are we certain its a sweep pulse? And do we have a certain dual lock.
            LastPulse->ReadOut = true;
            Angles[SweepSource][SweepAxis] = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks - SweepStartTime);
//            Serial.print("Certain Sweep-");
//            Serial.print(SweepSource);
//            Serial.print(" - ");
//            Serial.println(SweepAxis);
        }
        else if (LastPulse->IsUncertainShortPulse) { //We are not certain its a sweep, but its too short to accurately measure its width...

        }
    }
}