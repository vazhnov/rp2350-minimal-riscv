.section .text.init.enter, "ax"

.option norvc
  la sp, 0x20082000
  j _start
.option rvc

.word 0xffffded3
.word 0x11010142
.word 0x000001ff
.word 0x00000000
.word 0xab123579
