; boot.s
[BITS 32]
[ORG 0x100000]

; Multiboot header
multiboot_header:
    dd 0x1BADB002      ; magic number
    dd 0x00010003      ; flags: align modules, memory info
    dd -(0x1BADB002 + 0x00010003) ; checksum

start:
    ; setup kernel stack, etc
    cli
    xor eax, eax
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000

    ; jump to kernel entry point
    call kernel_main

hang:
    hlt
    jmp hang
