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
    bool IsCertainSyncPulse;
    bool IsCertainSweepPulse;
    bool IsUncertainShortPulse;
    bool ReadOut;
};

class SensorNode {
public:
    SensorNode(SensorPinData_t PinData);

    ~SensorNode();

    void Init();

    void RisingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall);

    void FallingEdge(u_int32_t TimeTicks, uint_fast8_t ConseqRise, uint_fast8_t ConseqFall);

    u_int8_t GetPulsePin();

    bool NeedsPulseHandling();

    Pulse *PulseHandler();

    int8_t WaveformPointer;
    int8_t ProcessPointer;
    Pulse Waveform[WAVEFORM_SIZE];

    int8_t ProcessPointerOffset(int8_t Offset);

    bool CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                             u_int8_t CurrentStationLock);

    float Angles[2][2];
    float Location[3];

    int8_t LastProcessPointer();

    void SetLEDState(int LEDState);

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

    SensorPinData_t _PinData;
};


#endif //TEENSYVIVE_TEENSY31_INPUTCHANNEL_H
