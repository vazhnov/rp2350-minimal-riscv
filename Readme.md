# rp2350-minimal-riscv

As in my rp2350-minimal repository, we refer to RP2350's datasheet as [rp2350]. It can be found at <https://datasheets.raspberrypi.com/rp2350/rp2350-datasheet.pdf>.

The present repository is a twin to the [rp2350-minimal](https://github.com/mtkos/rp2350-minimal) repository. It contains the same programs, but adapted to run on the RISC-V cores. The only exception is the `systick` program. SysTick is an ARM
peripheral, not present on RP2350's RISC-V cores. Instead, there is the RISC-V platform timer, see [rp2350], section 3.1.8, which can be used for similar purposes. The program is still called
`systick`, although it is very different from the ARM version.
