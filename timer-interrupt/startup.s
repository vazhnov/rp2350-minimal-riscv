.set MIE, 1<<3
.set MEIE, 1<<11
.set meiea, 0xbe0
.set PWM_IRQ_WRAP_0_IRQn, 8
.set mask, ((1<<(PWM_IRQ_WRAP_0_IRQn%16))<<16 | (PWM_IRQ_WRAP_0_IRQn/16))

.section .init

.option norvc
  la sp, _estack

  li t0, MIE
  csrw mstatus, t0

  li t0, MEIE
  csrw mie, t0

  li t0, mask
  csrw meiea, t0

  la t0, PWM_IRQ_WRAP_0_Handler
  csrw mtvec, t0

  j      prog
.option rvc

.word 0xffffded3
.word 0x11010142
.word 0x000001ff
.word 0x00000000
.word 0xab123579
