all: rk86bdos build-tests

rk86bdos:
	asl rk86bdos.asm
	p2bin -r 0x-0x rk86bdos.p

build-tests:
	cat rk86bdos.bin 8080PRE.COM >rk8080pre.bin
	cat rk86bdos.bin TEST.COM >rk86test.bin
	cat rk86bdos.bin CPUTEST.COM >cputest.bin
	cat rk86bdos.bin 8080EX1.COM >rk86ex1.bin

clean:
	-rm rk86bdos.p rk86bdos.bin
	-rm rk8080pre.bin rk86test.bin cputest.bin rk86ex1.bin

