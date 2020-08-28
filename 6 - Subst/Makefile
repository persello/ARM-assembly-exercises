.SILENT:
.PHONY: clean all run

all: subst_test

run: subst_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	./subst_test

debug: subst_test
	qemu-arm -L /usr/arm-linux-gnueabi/ \
	-E LD_LIBRARY_PATH=/usr/arm-linux-gnueabi/lib/ \
	-g 2400 \
	./subst_test

subst_test: obj obj/main.o obj/subst.o
	echo "Linking executable"
	arm-linux-gnueabi-gcc -g -o subst_test obj/main.o obj/subst.o

obj/subst.o: subst.S
	echo "Building subst.o"
	arm-linux-gnueabi-as -g -o obj/subst.o subst.S

obj/main.o: main.c
	echo "Building main.o"
	arm-linux-gnueabi-gcc -g -c -o obj/main.o main.c

obj:
	mkdir obj

clean: 
	rm -rf obj/ subst_test