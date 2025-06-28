# the blink-small program

The main program is identical to the ARM version. The startup code is different. For RISC-V, the bootrom hands over program flow to the first instruction in flash, see [rp2350], section 5.9.5.2.

So the startup code sets the stack pointer and jumps to the main program. The magic bytes ([rp2350], section 5.9.5.2) have been put right after the jump instruction. To assure that they are
word-aligned, the assembly option `norvc` (no compressed instructions) is used.
