CFLAGS=-fPIC -Wall -O
LD_FLAGS=-x --shared -lpam -lcrypt -lnfc -lc -ldl

all : pamodule adder

pamodule : pam_nfc.o nfc.o
	ld -o pam_nfc.so pam_nfc.o nfc.o $(LD_FLAGS)

adder : nfc.o
	gcc -o nfc-pam-add nfc-pam-add.c nfc.o -lcrypt -lnfc -O

clean:
	rm -f *.o *~ pam_nfc.so nfc-pam-add
