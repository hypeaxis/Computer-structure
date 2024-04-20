.data
A: .word 7,-2,5,1,5,6,7,3,6,8,8,59,5  
Aend: .word                                       
string: .asciiz "\n"                             
.text
main:   
    	la $a0, A #$a0 = Address(A[0])
	la $a1, Aend
    	addi $a1, $a1, -4 #$a1 = Address(A[n-1])
    	j bubble_sort

bubble_sort:    
    	# Outer loop for iterating over the array
    	la $t3, A        
    
outer_loop:
    	#if no swap, set $t2 to 0
    	li $t2, 0          
    
    	# Inner loop for performing bubble sort on the array
    	la $t0, A        
    
inner_loop:
    	lw $t4, 0($t0)   
    
    	addi $t1, $t0, 4
    	lw $t5, 0($t1)   
    
    	# Compare the current element with the next element
    	ble $t4, $t5, no_swap
    
    	#Swap
    	sw $t5, 0($t0)    
    	sw $t4, 0($t1)    
    
    	#if a swap was made, set $t2 to 1
    	li $t2, 1          
    
no_swap:
    	# Move to the next pair of elements
    	addi $t0, $t0, 4
    	addi $t1, $t1, 4   
    
    	# Check if we have reached the end of the array
    	bne $t0, $a1, inner_loop
    
    	# If no swaps were made in this pass, the array is sorted
    	beq $t2, $zero, end_bubble_sort
    
    	# Move to the next element in the outer loop
    	addi $t3, $t3, 4    
    
# Check if we have reached the end of the array
    	bne $t3, $a1, outer_loop
    
end_bubble_sort:
    	# Print the sorted array
    	la $t0, A          # $t0 holds the address of the first element of A
    
print_loop:
    	lw $a0, 0($t0)  
    	li $v0, 1        
    	syscall           
    
    	li $v0, 4         
    	la $a0, string
    	syscall           # Print string
    
    	# Move to the next element
    	addi $t0, $t0, 4
    
    	# Check if we have reached the end of the array
    	ble  $t0, $a1, print_loop
    
    	# Exit the program
    	li $v0, 10
    	syscall
