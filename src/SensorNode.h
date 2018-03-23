
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
#define AVERAGE_SIZE 10

    void MovingAverageAdd(float New, u_int8_t Source, u_int8_t Axis);

    float MovingAverageCalc(u_int8_t Source, u_int8_t Axis);

    float AverageAngle[2][2][AVERAGE_SIZE];
    u_int8_t AverageAnglePointers[2][2];

    bool CheckAndHandleSweep(u_int32_t Now, u_int8_t SweepSource, u_int8_t SweepAxis, u_int32_t SweepStartTime,
                             u_int8_t CurrentStationLock);

    void PrepareForReading();

    float Angles[2][2];
    float Location[3];

    void SetLEDState(int LEDState);

protected:

private:
    SensorPinData_t _PinData;
};


#endif //TEENSYVIVE_TEENSY31_INPUTCHANNEL_H
