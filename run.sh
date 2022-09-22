nasm "boot.asm" -f bin -o "Binaries/boot.bin"
cat "Binaries/boot.bin" > "Binaries/OS.bin"

qemu-system-x86_64 -drive format=raw,file="Binaries/OS.bin",index=0,if=floppy, -m 128M