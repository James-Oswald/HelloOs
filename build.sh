
#set this to the path the the bin folder containing your cross compiler
export I386TOOLPATH="$HOME/os/cross/bin"

#compile our source files (.s and .c) into binary objects with machine code and symbol tables (.o files)
$I386TOOLPATH/i686-elf-as -o boot.o boot.s
$I386TOOLPATH/i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#combine our object files in the format specified by our linker script (linker.ld)
$I386TOOLPATH/i686-elf-gcc -T linker.ld -o HelloOs.bin -ffreestanding -O0 -nostdlib  kernel.o boot.o -lgcc

#setup a directory structure to be written to our ISO and make the ISO image
cp HelloOs.bin isodir/boot/HelloOs.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o HelloOs.iso isodir

#run the OS, this can be done using virtualbox or QEMU on a desktop system
#/mnt/d/Programming/QEMU/qemu-system-i386.exe -cdrom HelloOs.iso