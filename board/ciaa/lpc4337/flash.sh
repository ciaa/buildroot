#!/bin/sh
CFG=board/ciaa/lpc4337/openocd.cfg
OOCD=output/host/usr/bin/openocd
BIMAGE=output/images/u-boot.bin
KIMAGE=output/images/uImage
$OOCD -f $CFG \
	-c "init" \
	-c "reset" \
	-c "halt" \
	-c "flash write_image erase unlock $KIMAGE 0x14000000 bin" \
	-c "flash write_image erase unlock $BIMAGE 0x1a000000 bin" \
	-c "reset" \
	-c "exit"
