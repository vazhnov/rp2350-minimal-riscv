# the exti-interrupt program

The program is entirely similar to the ARM version, with the exception of interrupt configuration. This is done as in the `systick` program. Only instead of the `MTIE` bit, the `MEIE` (enable external
interrupts) bit has to be set in the `mie` register. Finally, a bit, corresponding to the interrupt number, has to be set in the external interrupt enable array. This is done through the
`meiea` control register.
