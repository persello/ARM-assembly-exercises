.SILENT:
.PHONY: clean all run

all: prime_test

run: prime_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./prime_test

debug: prime_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./prime_test

prime_test: obj obj/main.o obj/nprimes.o obj/isprime.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o prime_test obj/main.o obj/nprimes.o obj/isprime.o

obj/nprimes.o: nprimes.S
	echo "Building nprimes.o"
	arm-linux-gnueabi-as -g -o obj/nprimes.o nprimes.S

obj/isprime.o: isprime.c
	echo "Building isprime.o"
	arm-linux-gnueabi-gcc -g -c -o obj/isprime.o isprime.c

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ prime_test