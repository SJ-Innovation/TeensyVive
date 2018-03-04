//
// Created by Sam Lane on 10/02/2018.
//

#ifndef TEENSYVIVE_TEENSY31_INPUTCHANNEL_H
#define TEENSYVIVE_TEENSY31_INPUTCHANNEL_H

#include "Arduino.h"
#include "Timing.h"
#include "config.h"

#define WAVEFORM_SIZE 10

struct Pulse {
    u_int32_t RisingEdgeTicks; //ISR Set
    u_int32_t FallingEdgeTicks; //ISR Set
    u_int32_t PulseDurationTicks; //Rising to falling
    //u_int32_t LastPulseToThisPulseTicks;
    bool Valid;
    bool IsSyncPulse;
    bool IsSweepPulse;
    bool ReadOut;
};

class SensorNode {
public:
    SensorNode(u_int8_t InputPin);

    ~SensorNode();

    void Init();

    void RisingEdge(u_int32_t TimeTicks);

    void FallingEdge(u_int32_t TimeTicks);

    u_int8_t GetPin();

    bool NeedsPulseHandling();

    Pulse* PulseHandler();

    int8_t WaveformPointer;
    int8_t ProcessPointer;
    Pulse Waveform[WAVEFORM_SIZE];

    int8_t ProcessPointerOffset(int8_t Offset);
    void CheckAndHandleSweep(u_int8_t SweepSource,u_int8_t SweepAxis,u_int32_t SweepStartTime);
    float Angles[2][2];
    float Location[3];

    int8_t LastProcessPointer();

protected:

private:
    void IncProcessPointer();

    void DecProcessPointer();

    int8_t NextProcessPointer();

   // int8_t LastProcessPointer();

    void IncWaveformPointer();

    void DecWaveformPointer();

    int8_t NextWaveformPointer();

    int8_t LastWaveformPointer();

    int _InputPin;
};


#endif //TEENSYVIVE_TEENSY31_INPUTCHANNEL_H
