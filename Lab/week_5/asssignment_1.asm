#DO TUAN MINH - 20225741

.data
	test: .asciiz "Hello world"
.text
	li $v0, 4
	la $a0, test
	syscall
