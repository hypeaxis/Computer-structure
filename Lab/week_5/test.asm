.data
    max_length: .equ 20      #Maximum characters allowed (excluding null terminator)
    prompt: .asciiz "Enter a string (max 20 characters): "
    newline: .asciiz "\n"

.text
# Function to get user input with a maximum length
get_user_input:
    # Args:
    #   - return: string address (in $a0)
    # Print the prompt message
    li $v0, 4          
    syscall 		# for printing a string
    la $a0, prompt      # Load address of prompt message
    syscall             # Print prompt

    # Read user input with maximum length check
    li $v0, 8          # syscall for reading a string
    la $a0, user_input  # Load address of input buffer
    la $a1, max_length  # Maximum allowed characters
    syscall             # Read user input

    # Find the actual input length (excluding null terminator)
    move $t0, $a0
    find_null:
        lb $t1, 0($t0)
        beq $t1, $zero, end_get_input
        addi $t0, $t0, 1
        j find_null

end_get_input:
    sub $t0, $t0, $a0   # Calculate actual input length

# Function to print a string in reverse
print_reversed:
    # Args:
    #   - string_addr: address of the string (in $a0)
    #   - length: length of the string (in $t0)
    beq $t0, 0, exit  # No input, exit

    # Loop through characters in reverse order and print them
loop_print_reverse:
        add $t1, $a0, $t0  # Calculate address of last character
        sub $t1, $t1, 1     # Move to the character before last
        lb $a0, 0($t1)       # Load character at current position
        li $v0, 11         # syscall for printing a character
        syscall             # Print the character
        addi $t0, $t0, -1    # Decrement length counter

        bgtz $t0, loop_print_reverse  # Loop back if more characters

    # Print newline
    li $v0, 4          # syscall for printing a string
    la $a0, newline     # Load address of newline message
    syscall             # Print newline

exit:
    # Exit program (no return value)
    li $v0, 10          # syscall for exiting the program
    syscall             # Exit

.data
    user_input: .space max_length+1  #Allocate space for max_length + null terminator
