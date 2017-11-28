PRU_CGT:=/usr/share/ti/cgt-pru
PRU_SUPPORT:=/usr/lib/ti/pru-software-support-package
PRU_INCLUDE:= --include_path=/usr/include/arm-linux-gnueabihf/ --include_path=$(PRU_SUPPORT)/include --include_path=$(PRU_CGT)/include 
PRU_TOOLS:=/usr/bin/

LINKER_CMD_FILE:=AM335x_PRU.cmd

CFLAGS=-v3 -O2 --endian=little --hardware_mac=on

LDFLAGS+= -L.

am335x-pru0-fw: blink.c
	$(PRU_TOOLS)clpru $(CFLAGS) $(PRU_INCLUDE) -ppd -ppa -fe blink0.object blink.c -D PRU0
	$(PRU_TOOLS)clpru -z $(LINKER_CMD_FILE) -i$(PRU_CGT)/lib -o am335x-pru0-fw blink0.object

install: am335x-pru0-fw
	cp am335x-pru0-fw /lib/firmware
	rmmod -f pru_rproc
	modprobe pru_rproc
