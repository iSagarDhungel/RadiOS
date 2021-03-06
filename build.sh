nasm -f elf32 kernel/source/kernel.asm -o kernel/objfiles/kerasm.o
gcc -m32 -c kernel/source/kernel.c -o kernel/objfiles/kerc.o -ffreestanding
gcc -m32 -c includes/system.c -o objfiles/system.o -ffreestanding 
gcc -m32 -c includes/string.c -o objfiles/string.o -ffreestanding 
gcc -m32 -c includes/keyboard.c -o objfiles/keyboard.o -ffreestanding 
gcc -m32 -c includes/screen.c -o objfiles/screen.o -ffreestanding 
ld -m elf_i386 -T linker/link.ld -o kernel/kernel.bin kernel/objfiles/kerasm.o kernel/objfiles/kerc.o objfiles/system.o objfiles/string.o objfiles/screen.o objfiles/keyboard.o
qemu-system-i386 -kernel kernel/kernel.bin
grub-mkrescue -o disk_images/radios.iso kernel/kernel.bin
