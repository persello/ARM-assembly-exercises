.SILENT:
.PHONY: clean all run

all: oddsum_test

run: oddsum_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./oddsum_test

debug: oddsum_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./oddsum_test

oddsum_test: obj obj/main.o obj/oddsum.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o oddsum_test obj/main.o obj/oddsum.o

obj/oddsum.o: oddsum.S
	echo "Building oddsum.o"
	arm-linux-gnueabi-as -g -o obj/oddsum.o oddsum.S

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ oddsum_test