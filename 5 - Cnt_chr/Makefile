.SILENT:
.PHONY: clean all run

all: cnt_chr_test

run: cnt_chr_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./cnt_chr_test

debug: cnt_chr_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./cnt_chr_test

cnt_chr_test: obj obj/main.o obj/cnt_chr.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o cnt_chr_test obj/main.o obj/cnt_chr.o

obj/cnt_chr.o: cnt_chr.S
	echo "Building cnt_chr.o"
	arm-linux-gnueabi-as -g -o obj/cnt_chr.o cnt_chr.S

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ cnt_chr_test