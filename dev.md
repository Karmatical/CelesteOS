
# Developing your Operating System

## Dev Software
---------------------------------------------------------------------------------------------------
- Visual Studio Code                        -       IDE                                                  - https://code.visualstudio.com/download
---------------------------------------------------------------------------------------------------
- Msys (64x)                                -       Package Manager (Pacman)                             - https://www.msys2.org/
  **Package** 
  - Base                                    -       Contains make, gcc, binutils, git                    $ pacman -S base-devel git       
  - MinGW64 x86_64 Package Config           -       Optional, for kernel libs                            $ pacman -S mingw-w64-x86_64-pkg-config
  - MinGW64 x86_64 Cmake                    -       Optional, for kernel libs                            $ pacman -S mingw-w64-x86_64-cmake
  - Nasm                                    -       Assembly Compiler for Kernel and Bootloader          $ pacman -S nasm
---------------------------------------------------------------------------------------------------
- Cross-Compiler Toolchain                  -       Kernel Freestanding and GCC to ELF                   - https://github.com/trcrsired/windows-hosted-x86_64-elf-toolchains
Needs to have his bin folder added 
to PATH alongside having this command 
executed in Msys:
>$ export PATH=$PATH:/ ... PATH ... /x86_64-elf/bin      (Example: f/x86_64-elf/bin for F:/x86_64...)
---------------------------------------------------------------------------------------------------
- Qemu (x86_64)                             -       x86 Emulator                                         - https://qemu.weilnetz.de/w64/
Can be obtained as a EXE (Binaries) or downloaded 
as MinGW Package using pacman by:
>$ pacman -S mingw-w64-x86_64-qemu
---------------------------------------------------------------------------------------------------
NÃO ATUALIZADO

Sistema de arquivos padrão usado em ISOs: ISO9660
