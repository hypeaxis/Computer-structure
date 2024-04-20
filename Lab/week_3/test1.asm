.data
A: .word 10, 2, 3, 6, -1, 8
.text 
	#$s5: sum, $s1: bien chay i
	li $s5, 0
	li $s1, 0
	li $s3, 6 # n = 6
	
	la $s2, A # s2 = base address of A
LOOP:
	#do something
	slt $t2, $s1, $s3
	beq $t2, 0, DONE
	
	add $t1, $s1, $s1 # t1 = 2 * i
	add $t1, $t1, $t1 # t1= 4 * i
	
	add $t9, $t1, $s2
	lw $t0, 0($t9)
	add $s5, $s5, $t0
	
	addi $s1, $s1,1
	j LOOP
DONE: