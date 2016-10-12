#ifndef _CLZ_ALGO_H
#define _CLZ_ALGO_H

#include <stdint.h>

uint8_t clzIteration(uint32_t x);
uint8_t clzBinarySearch(uint32_t x);
uint8_t clzByteShift(uint32_t x);

/* Harley’s algorithm */
uint8_t clzHarley(uint32_t x);

#endif
