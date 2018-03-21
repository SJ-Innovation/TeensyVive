
#ifndef TEENSYVIVE_TEENSY31_INPUTCHANNEL_H
#define TEENSYVIVE_TEENSY31_INPUTCHANNEL_H

#include "Arduino.h"
#include "Timing.h"
#include "config.h"

//#define WAVEFORM_SIZE 10

struct Pulse {
    u_int32_t Length;
    u_int32_t StartTime;
    bool New:1;
};

class SensorNode {
public:
    SensorNode(SensorPinData_t PinData);

    ~SensorNode();

    void Init();

    u_int8_t GetPulsePin();

    void NewSweepInterrupt(u_int32_t PulseLength, u_int32_t PulseStartTime);

    Pulse LatestSweepInterrupt;
    bool CheckAndHandleSweep(u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                             u_int8_t CurrentStationLock, Pulse *Temp);
    float Angles[2][2];
    float Location[3];

    void SetLEDState(int LEDState);

protected:

private:
    SensorPinData_t _PinData;
};


#endif //TEENSYVIVE_TEENSY31_INPUTCHANNEL_H
