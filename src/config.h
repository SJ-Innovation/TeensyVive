//
// Created by Sam Lane on 11/02/2018.
//
//#include "SensorNode.h"
#include "Timing.h"
#include "math.h"

#ifndef TEENSYVIVE_TEENSY31_CONFIG_H
#define TEENSYVIVE_TEENSY31_CONFIG_H
// ====================================HARDWARE CONFIGURATION=====================================
#define SENSOR_1_PIN 9
#define SENSOR_2_PIN 10
#define SENSOR_3_PIN 11
#define SENSOR_4_PIN 12

// ===============================================================================================
// ====================================MISC SETTINGS===================================================
#define SINGLE_STATION_TRACKING
#define BASESTATION_ROTOR_ANGLE 180
#define OOTX_FRAME_SIZE 0x21 //TODO OOTX
#define OOTX_BUFFER_LENGTH  2*OOTX_FRAME_SIZE
#define MAX_PULSE_AGE_TICKS US_TO_TICKS(10000)
// ================================================================================================
// ====================================PULSE LENGTHS===============================================
#define SWEEP_PULSE_LENGTH_TICKS_MIN US_TO_TICKS(2)
#define SWEEP_PULSE_LENGTH_TICKS_MAX US_TO_TICKS(15)
#define FLASH_PULSE_LENGTH_TICKS_MIN US_TO_TICKS(50)
#define FLASH_PULSE_LENGTH_TICKS_MAX US_TO_TICKS(150)


#define PULSETRAIN_START_TICKS US_TO_TICKS(0)
#define PULSETRAIN_SYNC_DISCREPANCY US_TO_TICKS(10)
#define PULSETRAIN_SYNCA_START_TICKS US_TO_TICKS(0)
#define PULSETRAIN_SYNCB_START_TICKS US_TO_TICKS(400)
#define PULSETRAIN_SWEEP_START_TICKS US_TO_TICKS(1222)
#define PULSETRAIN_SWEEP_END_TICKS US_TO_TICKS(6777)
#define PULSETRAIN_FINISH_TICKS US_TO_TICKS(8333)


// ================================================================================================
//==================================== CONSTANTS ====================================================
#define SKIP(PulseData) ((PulseData & 4) ? 1:0)
#define DATA(PulseData) ((PulseData & 2) ? 1:0)
#define AXIS(PulseData) ((PulseData & 1) ? 1:0)

#define AXIS_t u_int8_t
#define HORZ 0
#define VERT 1
#define X_AXIS 0
#define Y_AXIS 1
#define Z_AXiS 2
#define STATION_A 0
#define STATION_B 1

// ===================================================================================================
// ====================================SPACE GEOMETRY=================================================
#define BASESTATION_DELTA_X 3000 //MM
#define BASESTATION_DELTA_Y 3000
#define BASESTATION_DELTA_Z 3000


#define BASESTATION_XY_DIST (u_int32_t)hypot(BASESTATION_DELTA_X,BASESTATION_DELTA_Y)
#define BASESTATION_XZ_DIST (u_int32_t)hypot(BASESTATION_DELTA_X,BASESTATION_DELTA_Z)
#define BASESTATION_YZ_DIST (u_int32_t)hypot(BASESTATION_DELTA_Y,BASESTATION_DELTA_Z)


// ===================================================================================================
// ====================================MACROS=========================================================
#define SYNC_PULSE_MEANING(Ticks) ((u_int8_t)((TICKS_TO_VIVE_STANDARD(Ticks)-2501)/500))
#define PULSETRAIN_SWEEP_LENGTH_TICKS (PULSETRAIN_SWEEP_END_TICKS-PULSETRAIN_SWEEP_START_TICKS)
#define STATION_SWEEP_DEGREES_PER_TICK (STATION_SWEEP_ARC_DEGREES / PULSETRAIN_SWEEP_LENGTH_TICKS)
#define PULSETRAIN_LENGTH_TICKS (PULSETRAIN_FINISH_TICKS-PULSETRAIN_START_TICKS)
#define TICKS_BETWEEN_SYNC_PULSES (PULSETRAIN_SYNCB_START_TICKS-PULSETRAIN_SYNCA_START_TICKS)
#define TICKS_PER_DEGREE (((float)PULSETRAIN_SWEEP_END_TICKS-(float)PULSETRAIN_SWEEP_START_TICKS) / (float)BASESTATION_ROTOR_ANGLE)
#define TICKS_TO_DEGREES(x) ((float)x/(float)TICKS_PER_DEGREE)
#define DEGREES_TO_TICKS(x) (x*TICKS_PER_DEGREE)
#define TICKS_PER_RADIAN (((float)PULSETRAIN_SWEEP_END_TICKS-(float)PULSETRAIN_SWEEP_START_TICKS) / ((float)BASESTATION_ROTOR_ANGLE*DEG_TO_RAD))
#define TICKS_TO_RADIANS(x) ((float)x/(float)TICKS_PER_RADIAN)
#define RADIANS_TO_TICKS(x) (x*TICKS_PER_RADIAN)
#define RADIANS_TO_DEGREES(x) (x*RAD_TO_DEG)
#define DEGREES_TO_RADIANS(x) (x*DEG_TO_RAD)


#define BIT_BUFFER_WRITE(BitData, BitNum, ByteBuffer) (bitWrite(ByteBuffer[BitNum/8],8-(BitNum%8),BitData))
#define BIT_BUFFER_READ(BitNum, ByteBuffer) (bitRead(ByteBuffer[BitNum/8],8-(BitNum%8)))
// ===================================================================================================
#endif //TEENSYVIVE_TEENSY31_CONFIG_H
