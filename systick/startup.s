.set MIE, 1<<3
.set MTIE, 1<<7

.section .init

.option norvc
  la sp, _estack

  li t0, MIE
  csrw mstatus, t0

  li t0, MTIE
  csrw mie, t0

  la t0, SIO_IRQ_MTIMECMP_Handler
  csrw mtvec, t0

  j      prog
.option rvc

.word 0xffffded3
.word 0x11010142
.word 0x000001ff
.word 0x00000000
.word 0xab123579
