# DO TUAN MINH - 20225741
.text
li $s0, 0x12345678
andi $t1, $s0,0xff000000
srl $t2, $t1, 24
andi $s0, $s0, 0xFFFFFF00
xor $s0, $s0, 0x000000FF
xor $s0, $s0, $s0