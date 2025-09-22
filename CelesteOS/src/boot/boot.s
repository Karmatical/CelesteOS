
[bits 32]
[extern kernel_main]    ; kernel/kernel.c

section .text           ; nasm data header
global _start           ; nasm code header

_start:
    call kernel_main    ; kernel main

.hang:                  ; infinite loop (while(1){})
    hlt
    jmp .hang
