CC = gcc
CFLAGS = -O0 -std=gnu99 -Wall
#EXEC = clzAlgo

#default: $(EXEC)
default: clzAlgo.o
	$(CC) $(CFLAGS) clzAlgo.o time_test.c -DCLZINTERATION -o time_test_clzIteration
	$(CC) $(CFLAGS) clzAlgo.o time_test.c -DCLZBINARYSEARCH -o time_test_clzBinarySearch
	$(CC) $(CFLAGS) clzAlgo.o time_test.c -DCLZBYTESHIFT -o time_test_clzByteShift
	$(CC) $(CFLAGS) clzAlgo.o time_test.c -DCLZHARLEY -o time_test_clzHarley

SRCS_common = main.c

clzAlgo: $(SRCS_common) clzAlgo.c clzAlgo.h
	$(CC) $(CFLAGS) \
		-DIMPL="\"$@.h\"" -o $@ \
		$(SRCS_common) $@.c

plot: default
	{ /usr/bin/time -f 'clzIteration %e %U %S' ./time_test_clzIteration ; } 2> time.txt
	{ /usr/bin/time -f 'clzBinarySearch %e %U %S' ./time_test_clzBinarySearch ; } 2>> time.txt
	{ /usr/bin/time -f 'clzByteShift %e %U %S' ./time_test_clzByteShift ; } 2>> time.txt
	{ /usr/bin/time -f 'clzHarley %e %U %S' ./time_test_clzHarley ; } 2>> time.txt
	gnuplot runtime.gp

clean:
	rm -f $(EXEC) *.o runtime.png time.txt
