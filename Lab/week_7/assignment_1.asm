# DO TUAN MINH - 20225741

.text
main: 	li 	$a0, -45 #load input parameter 
 	jal 	abs #jump and link to abs procedure
 	nop
 	add 	$s0, $0, $v0
 	li 	$v0, 10 #terminate
 	syscall 
endmain:
#--------------------------------------------------------------------
# function abs
# param[in] $a0 the interger need to be gained the absolute value 
# return $v0 absolute value
#--------------------------------------------------------------------
abs:
 	sub 	$v0,$0,$a0 #put -(a0) in v0; in case (a0)<0
 	bltz 	$a0,done #if (a0)<0 then done
 	nop
 	add 	$v0,$a0,$0#else put (a0) in v0
done:
 	jr 	$ra