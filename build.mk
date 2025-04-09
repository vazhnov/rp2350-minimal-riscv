PREFIX = riscv64-unknown-elf
OC = $(PREFIX)-objcopy
CC = $(PREFIX)-gcc
SZ = $(PREFIX)-size
READELF = $(PREFIX)-readelf
OBJDUMP = $(PREFIX)-objdump
NM = $(PREFIX)-nm

FLAGS = -O -mabi=ilp32 -march=rv32imac_zicsr  -nostdlib -ffreestanding -Wall -Wl,-Map,$(TARGET).map

all: $(TARGET).uf2

$(TARGET).elf: $(SRC)
	$(CC) $(FLAGS) -o $@ $^

$(TARGET).bin: $(TARGET).elf
	$(OC) -O binary $^ $@

clean:
	$(RM) *.elf
	$(RM) *.bin
	$(RM) *.asm
	$(RM) *.map
	$(RM) *.uf2
	$(RM) *.dmp
	$(RM) *.pio.h
	$(RM) *.html

bin: $(TARGET).bin

load: $(TARGET).uf2
	cp $^ /media/$(USER)/RP2350

edit:
	nano -l main.c

touch:
	touch $(SRC)

size: $(TARGET).elf
	$(SZ) --format=SysV $^

readelf: $(TARGET).elf
	$(READELF) $^ -a

objdump: $(TARGET).elf
	$(OBJDUMP) -D > $(TARGET).dmp $^

nm: $(TARGET).elf
	$(NM) $^

$(TARGET).uf2: $(TARGET).bin
	../utils/bin2uf2.py $^ $@

uf2: $(TARGET).uf2
