# the systick program

The RISC-V processor cannot use the SysTick timer, because it is a Cortex-M private peripheral, see [rp2350], section 2.2.7. However, RISC-V features a similar peripheral, the RISC-V Platform timer.
See [rp2350], section 3.1.8. It can run directly from the system timer, but the default is that it runs from the tick timer, documented in [rp2350], section 8.5. This is also more flexible
because it can deliver ticks at a slower rate than the system clock, by setting the RISCV\_CYCLES register. The timer is 64-bits. For this reason, the timer counter and
compare registers come in pairs, containing the upper and lower 32 bits respectively. The lower 32 bits are latched, and written only when the higher 32 bits are set.
So, while in our program we use only the lower 32 bits, the upper bits still need to be set (to 0).

Furthermore, enabling interrupts is done differently. We cannot use the NVIC, because it is also a Cortex-M private peripheral. Instead, configuration is done in the CSR registers mstatus, mie and
mtvec, see [rp2350], section 3.8.9. We need to set the MIE (interrupt enable) bit of mstatus and the MTIE (timer interrupt enable) bit of mie to enable the interrupt. We then set the mtvec
register to contain the address of the interrupt handler. This address must be word-aligned, so the interrupt handler has been given the aligned(32) attribute.
The two MODE bits will be 0: when an interrupt is triggered the program counter is set to the address in mtvec. All this is done
in the startup.s code. This works as long as only one interrupt source is used. The (limited) interrupt handling possibilities of the Hazard3 processor are described in section 3.8.4.2 of [rp23250].
