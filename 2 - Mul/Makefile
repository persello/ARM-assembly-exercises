.SILENT:
.PHONY: clean all run

all: mul_test

run: mul_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./mul_test

debug: mul_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./mul_test

mul_test: obj obj/main.o obj/mymulv2.o obj/mymulv3.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o mul_test obj/main.o obj/mymulv2.o obj/mymulv3.o

obj/mymulv2.o: mymulv2.S
	echo "Building mymulv2.o"
	arm-linux-gnueabi-as -g -o obj/mymulv2.o mymulv2.S

obj/mymulv3.o: mymulv3.S
	echo "Building mymulv3.o"
	arm-linux-gnueabi-as -g -o obj/mymulv3.o mymulv3.S

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ mul_test