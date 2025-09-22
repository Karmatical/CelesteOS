
CC     = x86_64-elf-gcc
LD     = x86_64-elf-ld
AS     = nasm
QEMU   = qemu-system-x86_64

BUILD       = build
ARTEFACTS   = $(BUILD)/artefacts
BIN         = $(ARTEFACTS)/bin
OBJ         = $(ARTEFACTS)/o
SRC         = src

CFLAGS  = -m64 -ffreestanding -O2 -nostdlib
LDFLAGS = -T $(SRC)/linker.ld -z max-page-size=0x1000
FORMAT = elf64

GCC_PATH  = /f/x86_64-elf/bin
QEMU_PATH = /f/Qemu/Qemu
export PATH := $(PATH):$(GCC_PATH):$(QEMU_PATH)

# ---------------------------------------------
all: clear $(BUILD)/CelesteOS.iso

$(OBJ)/boot.o: $(SRC)/boot/boot.s
	mkdir -p $(OBJ)
	$(AS) -f $(FORMAT) $< -o $@

$(OBJ)/kernel.o: $(SRC)/kernel/kernel.c
	mkdir -p $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN)/kernel.bin: $(OBJ)/boot.o $(OBJ)/kernel.o
	mkdir -p $(BIN)
	$(LD) $(LDFLAGS) $(OBJ)/boot.o $(OBJ)/kernel.o -o $@

$(BIN)/os-image.bin: $(BIN)/kernel.bin
	cp $< $@

$(BUILD)/CelesteOS.iso: $(BIN)/os-image.bin
	cp $< $@

run: $(BUILD)/CelesteOS.iso
	$(QEMU) -cdrom $<

clean:
	rm -rf $(BUILD)