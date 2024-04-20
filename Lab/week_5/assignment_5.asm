#DO TUAN MINH - 20225741
.data
	str: .space 50

.text
INPUT_STR:
	li $v0, 8
	la $a0, str
	li $a1, 21
	syscall
GET_LEN:
	li $v0, 8
	la $t0, 0
COUNT_CHAR:
	add $t1, $a0, $t0
	lb $t2, 0($t1)
	beq $t2, $zero, DONE_1
	addi $v0, $v0, 1
	addi $t0, $t0, 1
	j COUNT_CHAR
	
DONE_1:
	addi $t0, $v0, 1
	move $s0, $a0
PRINT_REVERSE_1:
	li $v0, 11
	add $t1, $t0, $s0
	lb $a0, 0($t1)
	syscall
	add $t0, $t0, -1
	blt $t0, $zero, DONE_2
	j PRINT_REVERSE_1 
DONE_2:
	