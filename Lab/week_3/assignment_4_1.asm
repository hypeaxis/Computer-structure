#Laboratory Exercise 3, Home Assignment 1
start:
	li $t1, 1 # x = 1
	li $t2, 2 # y = 2
	li $t3, 3 # z = 3
	addi $s2, $zero, 4 # j = 4
	addi $s1, $zero, 5 # i = 5
	addi $s3, $zereo, 3 # m = 3
	addi $s4, $zero, 6 #n = 6
	add $t4, $s1,$s2 # t4 = i + j
	add $t0, $3,$s4 # t0 = m + n
 	ble $t0,$t4,else 
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else: 
	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif: