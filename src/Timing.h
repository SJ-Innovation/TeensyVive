//
// Created by Sam Lane on 11/02/2018.
//

#ifndef TEENSYVIVE_TEENSY31_TIMING_H
#define TEENSYVIVE_TEENSY31_TIMING_H


#include "Arduino.h"

#define BETTER_TIMER 3//0-Micros,1-IntervalTimer,2-EXPDirectFTM 3-PIT

#if BETTER_TIMER == 3


#define TICKS_PER_MICROSECOND (u_int32_t)((u_int32_t)F_BUS/(u_int32_t)1000000) // TODO CHANGE F_BUS for OC if REQUIRED
#define US_TO_TICKS(x) (x*TICKS_PER_MICROSECOND)
#define TICKS_TO_US(x) (x/TICKS_PER_MICROSECOND)
#define IN_RANGE(Low, Value, High) ((Value >= Low && Value <= High) ? 1:0)
#define CURRENT_TIME (UINT32_MAX - PIT_CVAL0)

#define VIVE_STANDARD_TICKS_PER_US 48
#define TICKS_TO_VIVE_STANDARD(x) (x*VIVE_STANDARD_TICKS_PER_US/TICKS_PER_MICROSECOND)


#else
#define TICKS_PER_MICROSECOND GetTicksPerMicrosecond()
#define CURRENT_TIME GetCurrentTimeTicks()
u_int32_t GetTicksPerMicrosecond();
u_int32_t GetCurrentTimeTicks();
#endif

void InitTimer();

#endif //TEENSYVIVE_TEENSY31_TIMING_H
