//
// Created by Sam Lane on 11/02/2018.
//


#include "Timing.h"


#if BETTER_TIMER == 3

void InitTimer() {

    SIM_SCGC6 |= SIM_SCGC6_PIT;
    PIT_LDVAL0 = UINT32_MAX;
    PIT_MCR = 0;
    PIT_TCTRL0 = 1;

}



//u_int32_t GetCurrentTimeTicks() {
//    return UINT32_MAX  - PIT_CVAL0;
//}
//
//u_int32_t GetTicksPerMicrosecond() {
//    return F_BUS / 1000000;
//}


#elif BETTER_TIMER == 2
volatile u_int16_t OverflowCounter;

void InitTimer() { //TODO: I can see this is going to be a ball-ache... Currently
    OverflowCounter = 0;
    noInterrupts();
    // FTM0_FMS = FTM_FMS_WPEN;
    FTM1_MOD = UINT16_MAX;
    FTM1_SC = FTM_SC_PS(1) | FTM_SC_CLKS(1) | FTM_SC_TOIE;
    NVIC_ENABLE_IRQ(IRQ_FTM1);
    NVIC_SET_PRIORITY(IRQ_FTM1, 255);
    interrupts();


}


void ftm1_isr() {
    FTM1_SC &= ~FTM_SC_TOF;
    OverflowCounter++;
    //OverflowCounter++;

}


u_int32_t GetTicksPerMicrosecond() {
    return (F_CPU / 2.0) / 1000000.0;
}


FASTRUN u_int32_t GetCurrentTimeTicks() {
    noInterrupts();
    u_int16_t Copy1 = FTM1_CNT;
    u_int16_t Copy2 = OverflowCounter;
    u_int16_t Copy3 = FTM1_CNT;
    interrupts();
    if (Copy3 >= Copy1) {
        return (Copy2 << 16) | Copy1;
    }
    else{
        return 0;
    }
    //return OverflowCounter;


}

#elif BETTER_TIMER == 1
#define BETTER_TIMER_INTERVAL 0.5
#include "IntervalTimer.h"
volatile u_int32_t Ticker = 0;
IntervalTimer BetterTimer;
void TickerIncrementer() {
    Ticker++;
}
void InitTimer() {
    BetterTimer.priority(127); //Slightly more important than IO capture
    BetterTimer.begin(TickerIncrementer, BETTER_TIMER_INTERVAL);
}
u_int32_t GetTicksPerMicrosecond() {
    return 1/BETTER_TIMER_INTERVAL;
}
u_int32_t GetCurrentTimeTicks() {
    noInterrupts();
    u_int32_t Copy = Ticker;
    interrupts()
    return Copy;
}
#else

void InitTimer() {
}

u_int32_t GetCurrentTimeTicks() {
    return micros();
}

u_int32_t GetTicksPerMicrosecond() {
    return 1;
}

#endif

