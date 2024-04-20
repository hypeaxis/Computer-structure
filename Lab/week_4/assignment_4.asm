 # DO TUAN MINH - 20225741
.text
start:
	addi $s1, $zero, 2147483647 # s1 = 2147483647
	addi $s2, $zero, 1 # s2 = 1
	li $t0, 0 # set t0 = 0
	addu $s3, $s1, $s2 # s3 = s2 + s1
	xor $t1, $s1, $s2 # test if s1 s2 have the same sign
	bltz $t1, NOT_OVERFLOW # branch to NOT_OVERFLOW if they have different signs
	xor $t2, $s1, $s3 # test if s1 s3 have the same sign
	bltz $t2, OVERFLOW # branch to OVERFLOW if they have different signs
	xor $t2, $s2, $s3 # test if s2 s3 have the same sign
	bltz $t2, OVERFLOW # branch to OVERFLOW if they have different signs
	j NOT_OVERFLOW
OVERFLOW:
	li $t0, 1 #set t0 = 1 if overflow
NOT_OVERFLOW: