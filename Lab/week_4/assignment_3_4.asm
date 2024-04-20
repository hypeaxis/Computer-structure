# DO TUAN MINH - 20225741

.text
	addi $s2, $zero, 5
	addi $s1, $zero, -4
	slt $t0, $s2, $s1
	beq $t0, $zero, L
	
	addi $s3, $zero, 1
	
L: