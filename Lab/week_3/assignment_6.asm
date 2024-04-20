.data
Array: .word 1, 2, -3, 4, 6

.text
	la $t0, array 
	addi $t3, $zero, 4
	addi $s0, $zero, 1
	addi $s1, $zero, 0

loop1: 
	add $s1, $s1, $s0
	lw $t2, 0($t0)
	blt $t2, $zero, convert
	addi $t0, $t0, 4
	blt $s1, $t3, loop1
	j endloop1

convert:
	addi $t8, $zero, -1
	mul $t2, $t2, $t8
	sw $t2, 0($t0)
	addi $t0, $t0, 4
	blt $s1, $s3, loop1
	j loop1

endloop1:
	addi $s1, $zero, 0 
	addi $s2, $zero, 0
	
loop2: 
	add $s1, $s1, $s0
	lw $t2, 0($t0)
	bge $t2, $s2, update
	addi $t0, $t0, 4
	blt $s1, $s3, loop2
	j endloop2
	
update:
	add $s2, $zero, $t2
	addi $t0, $t0, 4
	blt $t1, $t3, loop2
	j loop2
	
endloop2:
