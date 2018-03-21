
#include "OOTX.h"
#include "config.h"

BaseOOTX::BaseOOTX(int ID) {
    _ID = ID;
    InputPointer = 0;
    memset(InputBuffer, 0, OOTX_BUFFER_SIZE);

}

BaseOOTX::~BaseOOTX() {
}

void BaseOOTX::PrintBuffer() {
    for (int i = 0; i < OOTX_BUFFER_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            Serial.print(bitRead(InputBuffer[i], 7 - j));
        }
        Serial.print(" ");
    }
    Serial.println(" ");
}



bool BaseOOTX::AttemptParse() {
    if (BIT_BUFFER_READ(0, InputBuffer)) { // Is the first bit 1, should be; end of preamble.
        for (u_int32_t i = 0; i < OOTX_BUFFER_SIZE_BITS; i += 17) { //Check each 16th bit, should be a 1. stuffed.
            Serial.print(BIT_BUFFER_READ(i, InputBuffer));
        }
        Serial.println(" ");
    }

}

bool BaseOOTX::NewOOTXBit(bool NewInBit) {
    static u_int8_t ConsecZeros = 0;
    if (NewInBit) { //1
        if (ConsecZeros == OOTX_PREAMBLE_LENGTH) { //Have we got the preamble?
            // AttemptParse();
            // PrintBuffer();
            ConsecZeros = 0;
            InputPointer = 0;
            memset(InputBuffer, 0, OOTX_BUFFER_SIZE);

        }

    }
    else {
        ConsecZeros++;
    }
    BIT_BUFFER_WRITE(NewInBit, InputPointer, InputBuffer);
    ++InputPointer %= OOTX_BUFFER_SIZE_BITS;

    return false;
}