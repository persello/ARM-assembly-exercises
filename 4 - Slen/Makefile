.SILENT:
.PHONY: clean all run

all: slen_test

run: slen_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./slen_test

debug: slen_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./slen_test

slen_test: obj obj/main.o obj/slen.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o slen_test obj/main.o obj/slen.o

obj/slen.o: slen.S
	echo "Building slen.o"
	arm-linux-gnueabi-as -g -o obj/slen.o slen.S

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ slen_test