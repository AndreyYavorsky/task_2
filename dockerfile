
FROM debian

WORKDIR /laba_2

COPY test_asm.asm test.c /laba_2/

RUN apt-get update;                         \
	apt-get install nano -y;                \
	apt-get install gcc -y;                 \
	apt-get install nasm -y;                \
	apt-get install gdb -y

CMD nasm -g -f elf test_asm.asm;            \
	ld -m elf_i386 test_asm.o -o test_asm;  \
	gcc -g test.c;                          \
	/bin/bash





