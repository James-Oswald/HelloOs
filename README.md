
# Hello OS

## Overview

This simple bare bones OS is based off the OS developed from the [OSDev Wiki Bare Bones Tutorial](https://wiki.osdev.org/Bare_Bones). The project was developed live at the third UAlbany IEEE OS development workshop to demonstrate the process and code for getting a simple "hello world" OS off the ground. A recording of that workshop which covered in depth how this was made from scratch can be found [here](https://youtu.be/NeSbIyh8VCE) on the UAlbany IEEE YouTube channel.   

## Building

1. This project is designed to be run on Ubuntu or Debian due to the packages you need. Despite this, OS Dev Wiki provides alternitve instructions for native Windows and OS X users to install the packages. We also note that the 3 people who build this at the time of writing used the Windows Linux Subsystem rather then directly using Ubuntu.
2. Install the reqired packages in `requiredPackages.txt`  
3. Follow [the OS Dev Cross Compiler Tutorial](https://wiki.osdev.org/GCC_Cross-Compiler) to build an assember and compiler that targets i386-elf.
5. set `I386TOOLPATH` in `build.sh` to the path for your cross compiler `i386` binaries. 
6. Run `build.sh`, if it fails, make sure you correctly installed ALL the reqired packages.
7. You should see a HelloOs.iso generated in the root directory, mount this to a VM and run it.

## File Overview

Package List:
* `requiredPackages.txt`: The packages you need for this project

Source Files:
* `boot.s`: The assembly code wrapper around our C Kernel, sets up our stack so we can call C.
* `kernal.c`: The source code for our "kenel", which just writes "Hello World" to the VGA buffer.

Config Files:
* `linker.ld`: Linker script telling the linker the entry point and order to our asm sections 
* `grub.cfg`: Tells grub what to display in its startup menu, adds our OS.

Build Scripts:
* `Build.sh`: Builds the Binary Objects, sets up the isodir structure and creates the .iso

Binary Objects: (Keeping these in so you can compare the ones you compile to the originals)
* `boot.o`: elf object for our boot.s file.
* `kernel.o`: elf object for our boot.s file.
* `HelloOs.bin`: raw binary of our OS set up by the linker script.

Disk Images:
* `HelloOs.iso`: The final bootable OS image that you can stick into a VM.  

## Notable Diffrences between Hello OS and the OSDev Bare Bones OS

* We forego a complex terminal in favor of directly writing to the VGA terminal buffer at 0xB8000
* We remove the wall of text comments from boot.s in favor of the explanation provided in our recording 

