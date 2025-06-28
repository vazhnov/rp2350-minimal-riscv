# the blink-multicore program

The only difference with the ARM version is that RISC-V has no `sev` instruction. Instead, the Hazard3 has a custom instruction, described in [rp2350], section 3.8.6.3.2, and encoded as
`slt x0, x0, x1`, so that it will be accepted by the assembler. It can be used as a replacement for `sev`.
