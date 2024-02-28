# Author: Kaden Jessee
# Desc: Add 3 numbers from memory and print the result
# Date: 10 Jan 2022

.data	# your "data"
out: .asciiz " The Result is: "
result: .word 0		# result
nums: .word -7, 20, -5	#numbers to add

.text	# actual instructions
.globl main
main:
	# print the initial string
	li $v0, 4
	la $a0, out
	syscall
	# load three numbers into registers
	la $t0, nums	# $t0 = nums
	lw $t1, 0($t0)	# $t1 = nums[0]
	lw $t2, 4($t0)	# $t2 = nums[1]
	lw $t3, 8($t0)	# $t3 = nums[2]
	
	# Add them up
	add $a0, $t1, $t2	# $a0 = $t1 + $t2
	add $a0, $a0, $t3	# $a0 = $a0 + $t3
	
	# Save the result
	sw $a0, result
	
	# print the result
	li $v0, 1
	syscall

exit:
	# exit program
	li $v0, 10
	syscall