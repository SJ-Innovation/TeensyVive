//
// Created by Sam Lane on 11/02/2018.
//


#include "Timing.h"
#include "config.h"


#if BETTER_TIMER == 3

u_int32_t InterSyncTime = US_TO_TICKS(400); //TODO Change for FTM timer scaling.
u_int32_t InterPulseTime = US_TO_TICKS(8333); //TODO THIS WILL OVERFLOW.

void SetPIT1Interrupt(u_int32_t Delta) {
    PIT_LDVAL1 = Delta;
}

void SetPIT2Interrupt(u_int32_t Delta) {
    PIT_LDVAL2 = Delta;
}


u_int32_t LastPLLTriggers[2] = {0, 0};

void PLLSyncA() {
    LastPLLTriggers[STATION_A] = CURRENT_TIME;
}

void PLLSyncB() {
    LastPLLTriggers[STATION_B] = CURRENT_TIME;
}


void pit1_isr() { // Pit1 on sync A
    PIT_TFLG1 = PIT_TFLG_TIF; // Clear interrupt flag
    PIT_TCTRL2 = 0; // Disable PIT2
    PIT_TFLG2 = PIT_TFLG_TIF; // Clear PIT2 Interrupt (so as not to immediately interrupt)
    PIT_TCTRL2 |= PIT_TCTRL_TIE | PIT_TCTRL_TEN; // Enable for the PIT2 interrupt, and start a new cycle.
    PLLSyncA();
}

void pit2_isr() { // Pit2 on sync B
    PIT_TFLG2 = PIT_TFLG_TIF; //Clear interrupt flag
    PIT_TCTRL2 = 0; // Disable another interrupt by disabling timer
    PLLSyncB();
}



// TODO PIT ISR for  counting at phase time. locked to input hardware rate for consistancy only when a firm dual lock is affirmed.
// TODO PIT ISR detect differences between phase of real and generated signal, then match generator to real. (with timings and phase, shouldbe a perfect recration of original)
//// TODO PIT ISR use current hardware position in cycle (axis and laser routine, choose what sync pulse lengths are expected to be)
//void PhaseLockTimerInterrupt() {
//    static bool LastStationEmu = 0;
//    static u_int32_t LastCallTime = 0;
//    u_int32_t Now = CURRENT_TIME;
//    bool CurrentStationEmu = !LastStationEmu;
//    if (CurrentStationEmu == STATION_A) {
//        SetPIT1Interrupt(InterSyncTime);
//        SetPIT2Interrupt(InterSyncTime);
//    }
//    if (CurrentStationEmu == STATION_B) {
//        SetPIT1Interrupt(InterPulseTime - InterSyncTime); // change for actual values
//    }
//
//    LastCallTime = Now;
//    LastStationEmu = CurrentStationEmu;
//}


void PhaseLockTimeLock(u_int32_t LastHardwareRiseA, u_int32_t LastHardwareRiseB) {
    static u_int32_t LastLastHardwareRiseA = 0;
    static u_int32_t LastLastHardwareRiseB = 0;
    static u_int32_t LastLastDelta = 0;
    if (LastHardwareRiseA == LastLastHardwareRiseA or LastHardwareRiseB == LastLastHardwareRiseB){ // If this isnt a new set of pulses
        return;
    }
    u_int32_t LastToThisA = LastHardwareRiseA - LastLastHardwareRiseA;
    u_int32_t LastToThisB = LastHardwareRiseB - LastLastHardwareRiseB;
    u_int32_t LastDelta = LastHardwareRiseB - LastHardwareRiseA;


    int64_t PhaseDiffA = LastPLLTriggers[STATION_A] - LastHardwareRiseA;
    int64_t PhaseDiffB = LastPLLTriggers[STATION_B] - LastHardwareRiseB;


    InterPulseTime = (0.9 * InterPulseTime) + (0.1 * ((LastToThisA + LastToThisB) / 2));
    InterSyncTime = (0.9 * InterSyncTime) + (0.1 * ((LastDelta + LastLastDelta) / 2));

    SetPIT1Interrupt(InterPulseTime);
    SetPIT2Interrupt(InterSyncTime);

    LastLastDelta = LastDelta;
    LastLastHardwareRiseA = LastHardwareRiseA;
    LastLastHardwareRiseB = LastHardwareRiseB;
}




//u_int32_t GetCurrentTimeTicks() {
//    return UINT32_MAX  - PIT_CVAL0;
//}
//
//u_int32_t GetTicksPerMicrosecond() {
//    return F_BUS / 1000000;
//}
// PIT 0 - Current Time, loaded with uint32max and counts down.
// PIT 1 - Phaselock Timer on SyncA
// PIT 2 - Phaselock Timer on SyncB
void InitTimer() {
    noInterrupts();
    SIM_SCGC6 |= SIM_SCGC6_PIT;
    PIT_MCR = 0;

    PIT_LDVAL0 = UINT32_MAX; // Setup current time PIT. Free Running. Never stops
    PIT_TCTRL0 = PIT_TCTRL_TEN;

    PIT_LDVAL1 = UINT32_MAX; // Start up the timer, will interrupt soon. This will be changed by phaselock loop
    PIT_TCTRL1 = PIT_TCTRL_TEN | PIT_TCTRL_TIE;

    //PIT_LDVAL2 = UINT32_MAX; // Start up the timer, will interrupt soon. This will be changed by phaselock loop
    //PIT_TCTRL2 = PIT_TCTRL_TEN | PIT_TCTRL_TIE;
    interrupts();
}

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

