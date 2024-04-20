#Laboratory 3, Home Assigment 2
.data
	 Array: .word 4, 5, 6, 7, 8 #20 bytes
.text
	addi $s1, $zero, 0 # i = 0
	addi $s3, $zero, 5 # N = 5
	la $s2, Array #load address of array to s2
	addi $s4, $zero, 1 #step = 1
	addi $s5, $zero, 0 #init_sum = 0

loop: 
	add  $t1, $s1, $s1 # t1 = 2*s1
	add $t1, $t1, $t1 # t1=4*s1
	add $t1, $t1, $s2 # t1 store the address of A[i[]
	lw $t0, 0($t1) # load the value of A[i] in t0
	add $s1, $s1, $s4 # i = i + step
	add $s5, $s5, $t0 # sum = sum + A[i]
	bne $s1, $s3, loop # go to loop if i != N

endloop: