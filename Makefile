# Compiladores e ferramentas
CC=x86_64-elf-gcc
LD=x86_64-elf-ld
AS=nasm
QEMU=qemu-system-x86_64

# Diretórios
BUILD=build
SRC=src

# Flags
CFLAGS=-m64 -ffreestanding -O2 -nostdlib
LDFLAGS=-T $(SRC)/linker.ld -z max-page-size=0x1000

# Atualização do PATH
GCC_PATH=/f/x86_64-elf/bin
QEMU_PATH=/f/Qemu/Qemu

export PATH := $(PATH):$(GCC_PATH):$(QEMU_PATH)

all: $(BUILD)/os-image.bin

$(BUILD)/boot.o: $(SRC)/boot/boot.s
	$(AS) -f elf64 $(SRC)/boot/boot.s -o $(BUILD)/boot.o

$(BUILD)/kernel.o: $(SRC)/os/kernel/kernel.c
	$(CC) $(CFLAGS) -c $(SRC)/kernel/kernel.c -o $(BUILD)/kernel.o

$(BUILD)/kernel.bin: $(BUILD)/boot.o $(BUILD)/kernel.o
	$(LD) $(LDFLAGS) $(BUILD)/boot.o $(BUILD)/kernel.o -o $(BUILD)/kernel.bin

$(BUILD)/os-image.bin: $(BUILD)/kernel.bin
	cp $(BUILD)/kernel.bin $(BUILD)/os-image.bin

run: $(BUILD)/os-image.bin
	$(QEMU) -drive format=raw,file=$(BUILD)/os-image.bin

clean:
	rm -f $(BUILD)/*.o $(BUILD)/*.bin
