#include <stdio.h>

#include "clzAlgo.h"

#define N 4000000

int main(int argc, char *argv[])
{
    uint8_t xClz = 0;
    uint32_t x = 0x03ffffff;

#if defined(CLZINTERATION)
    for(int i = 0; i < N; i++)
        xClz = clzIteration(x);
#endif

#if defined(CLZBINARYSEARCH)
    for(int i = 0; i < N; i++)
        xClz = clzBinarySearch(x);
#endif

#if defined(CLZBYTESHIFT)
    for(int i = 0; i < N; i++)
        xClz = clzByteShift(x);
#endif

#if defined(CLZHARLEY)
    for(int i = 0; i < N; i++)
        xClz = clzHarley(x);
#endif

    printf("x = 0x%x , clz(x) = %u\n", x, xClz);

    return 0;
}
