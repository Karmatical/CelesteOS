// Kernel básico em C
void kernel_main() {
    const char *msg = "CelesteOS iniciado!\n";

    char *video = (char*) 0xb8000;  // VRAM do modo texto
    for (int i = 0; msg[i] != '\0'; i++) {
        video[i * 2] = msg[i];      // caractere
        video[i * 2 + 1] = 0x07;    // cor (cinza em preto)
    }

    while (1) {}
}
