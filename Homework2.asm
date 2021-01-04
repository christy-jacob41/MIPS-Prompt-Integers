# Homework 2
# Christy Jacob

.data

# input values
a:	.word	3
b:	.word	4
c:	.word	5

# output values
ans1:	.word	3
ans2:	.word	4
ans3:	.word	5

# user name
userName:	.space	20

# messages
promptName:	.asciiz	"What is your name? "
promptIntegers:	.asciiz	"Please enter an integer between 1-100: "
resultsMessage:	.asciiz	"your answers are: "

# space
space: 		.asciiz	" "

.text
main:
# prompting and taking in user name
	li	$v0, 4
	la	$a0, promptName
	syscall
	
	li	$v0, 8
	la	$a0, userName
	li	$a1, 20
	syscall
	
# prompting and taking in 1st integers
	li 	$v0, 4
	la	$a0, promptIntegers
	syscall
	
	li	$v0, 5
	syscall
	sw	$v0, a
	
# prompting and taking in 2nd integer
	li 	$v0, 4
	la	$a0, promptIntegers
	syscall
	
	li	$v0, 5
	syscall
	sw	$v0, b

# prompting and taking in 3rd integer
	li 	$v0, 4
	la	$a0, promptIntegers
	syscall
	
	li	$v0, 5
	syscall
	sw	$v0, c
	
# calculating 1st answer
	lw	$t1, a
	lw	$t2, b
	add	$t3, $t1, $t1
	sub	$t4, $t3, $t2
	addi	$t5, $t4, 9
	sw	$t5, ans1

# calculating 2nd answer
	lw	$t3, c
	sub	$t4, $t3, $t2
	addi	$t5, $t1, -5
	add	$t6, $t4, $t5
	sw	$t6, ans2

# calculating 3rd answer
	addi	$t4, $t1, -3
	addi	$t5, $t2, 4
	addi	$t6, $t3, 7
	add	$t7, $t4, $t5
	sub	$t8, $t7, $t6
	sw	$t8, ans3
	
# displaying user name
	li 	$v0, 4
	la	$a0, userName
	syscall

# displaying message for results
	li 	$v0, 4
	la	$a0, resultsMessage
	syscall

# displaying the three answers with a space in between
	li 	$v0, 1
	lw	$a0, ans1
	syscall
	
	li	$v0, 4
	la	$a0, space
	syscall
	
	li 	$v0, 1
	lw	$a0, ans2
	syscall
	
	li	$v0, 4
	la	$a0, space
	syscall
	
	li 	$v0, 1
	lw	$a0, ans3
	syscall
	
	#exit program
	li	$v0, 10
	syscall

# Sample Run 1:
# Test Values: a = 25, b = 14, c = 41
# Expected Values: ans1 = 45, ans2 = 47, ans3 = -8

# Sample Run 2:
# Test Values: a = 77, b = 31, c = 40
# Expected Values: ans1 = 132, ans2 = 81, ans3 = 62
	
