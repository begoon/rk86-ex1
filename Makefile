all: build test release

build:
	asl 8080EX1.MAC
	p2bin -r 0x-0x 8080EX1.p

prepare-master:
	dd if=8080EX1.bin of=8080EX1.bin.test skip=256 bs=1
	dd if=./master/8080EX1.COM of=8080EX1.COM.master \
	bs=1 count=`stat -f "%z" 8080EX1.bin.test`

test: prepare-master
	diff 8080EX1.bin.test 8080EX1.COM.master

patch-ei:
	xxd -g 1 8080EX1.bin >8080EX1.bin.hex
	sed 's/fb 2a/00 2a/' 8080EX1.bin.hex >8080EX1.bin.hex.patched
	xxd -r 8080EX1.bin.hex.patched > 8080EX1.bin.patched

release: patch-ei
	cp 8080EX1.bin.patched rk86ex1.bin

diff:
	xxd 8080EX1.bin.test >8080EX1.bin.test.hex
	xxd 8080EX1.COM.master >8080EX1.COM.master.hex
	diff 8080EX1.bin.test.hex 8080EX1.COM.master.hex

clean:
	-rm 8080EX1.p 8080EX1.bin 8080EX1.bin.test rk86ex1.bin
	-rm 8080EX1.COM.master
	-rm 8080EX1.bin.test.hex 8080EX1.COM.master.hex
	-rm 8080EX1.bin.hex 8080EX1.bin.hex.patched
	-rm 8080EX1.bin.patched

