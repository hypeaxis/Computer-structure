#DO TUAN MINh - 20225741

.data
	msg1: .asciiz "The sum of "
	msg2: .asciiz " and "
	msg3: .asciiz " is "

.text 
start:
	li $s0, 10
	li $s1, 20
	add $s2, $s1, $s0
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $zero, $s1
	syscall
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $zero, $s2
	syscall