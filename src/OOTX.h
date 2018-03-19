

#ifndef TEENSYVIVE_TEENSY31_OOTX_H
#define TEENSYVIVE_TEENSY31_OOTX_H


#include "config.h"

class BaseOOTX {
public:
    BaseOOTX(int ID);

    ~BaseOOTX();

    void PrintBuffer();

    bool AttemptParse();

    bool NewOOTXBit(bool NewInBit);

protected:

private:
    u_int32_t InputPointer;
    u_int8_t InputBuffer[OOTX_BUFFER_SIZE];
    int _ID;
};


#endif //TEENSYVIVE_TEENSY31_OOTX_H
