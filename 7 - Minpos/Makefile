.SILENT:
.PHONY: clean all run

all: minpos_test

run: minpos_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./minpos_test

debug: minpos_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./minpos_test

minpos_test: obj obj/main.o obj/minpos.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o minpos_test obj/main.o obj/minpos.o

obj/minpos.o: minpos.S
	echo "Building minpos.o"
	arm-linux-gnueabi-as -g -o obj/minpos.o minpos.S

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ minpos_test