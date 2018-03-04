//
// Created by Sam Lane on 10/02/2018.
//

#include "SensorNode.h"


SensorNode::SensorNode(u_int8_t InputPin) {
    _InputPin = InputPin;
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
    Serial.print(_InputPin);
    pinMode(_InputPin, INPUT);
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

u_int8_t SensorNode::GetPin() {
    return _InputPin;
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

Pulse* SensorNode::PulseHandler() {

    Waveform[ProcessPointer].PulseDurationTicks =
            Waveform[ProcessPointer].FallingEdgeTicks - Waveform[ProcessPointer].RisingEdgeTicks;
    //Waveform[ProcessPointer].LastPulseToThisPulseTicks =
        //    Waveform[ProcessPointer].RisingEdgeTicks - Waveform[LastProcessPointer()].RisingEdgeTicks;
    Waveform[WaveformPointer].IsSyncPulse = (bool)IN_RANGE(FLASH_PULSE_LENGTH_TICKS_MIN,
                                                     Waveform[ProcessPointer].PulseDurationTicks,
                                                     FLASH_PULSE_LENGTH_TICKS_MAX);
    Waveform[WaveformPointer].IsSweepPulse = (bool)IN_RANGE(SWEEP_PULSE_LENGTH_TICKS_MIN,
                                                      Waveform[ProcessPointer].PulseDurationTicks,
                                                      SWEEP_PULSE_LENGTH_TICKS_MAX);
    Waveform[ProcessPointer].Valid = true;
    Waveform[ProcessPointer].ReadOut = false;
    IncProcessPointer();
    return &Waveform[LastProcessPointer()];
}

u_int32_t PulseAge(Pulse &TestPulse) {
    return CURRENT_TIME - TestPulse.RisingEdgeTicks;
}

void SensorNode::CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime) {
    Pulse* LastPulse = &Waveform[WaveformPointer];
    if (LastPulse->Valid and LastPulse->IsSweepPulse and not LastPulse->ReadOut){
        LastPulse->ReadOut = true;
        Angles[SweepSource][SweepAxis] = TICKS_TO_RADIANS(LastPulse->RisingEdgeTicks-SweepStartTime);

    }
}
