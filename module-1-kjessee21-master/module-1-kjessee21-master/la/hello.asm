# Author: Kaden Jessee
# My first program: Hello world

.data	# your "data"
hello: .asciiz "Hello Waldo"	# string hello = "Hello Waldo"

.text	# actual instructions

main:
	#print string
	li $v0, 4 	# says to print string
	la $a0, hello	# shows what string to print
	syscall
	
	# exit program
	li $v0, 10
	syscall