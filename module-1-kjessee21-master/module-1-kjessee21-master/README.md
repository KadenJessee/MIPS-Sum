# Module 1 Challenge Activity: Assembly Language Basics

- [Module 1 Challenge Activity: Assembly Language Basics](#module-1-challenge-activity-assembly-language-basics)
	- [Learning Activities](#learning-activities)
	- [Purpose](#purpose)
	- [Skills and Knowledge](#skills-and-knowledge)
	- [Taks 1: Print User Information](#taks-1-print-user-information)
		- [Sample Output Task 1](#sample-output-task-1)
	- [Task 2: Take user input](#task-2-take-user-input)
		- [Sample Output Task 2](#sample-output-task-2)
	- [Task 3: Add an immediate value](#task-3-add-an-immediate-value)
		- [Sample Output Task 3](#sample-output-task-3)
	- [Submission Checklist](#submission-checklist)
	- [Other Resources](#other-resources)
  

## Learning Activities

The learning activities related to this assignment are in the `la` folder of this project. If you need to review the concepts, follow the [LA README](la/README.md) 

## Purpose

This is an introductory assignment. The purpose of this assignment in to help you understand how to submit the files for this course and to practice the basics of the MIPS language.

## Skills and Knowledge

The goal of this lab is to get some initial experience programming in MIPS assembly language. Specifically, by the end of this assignment, you should feel comfortable:
1. Manipulating registers 
2. Doing basic integer arithmetic
3. Defining constants and variables in data memory
4. Reading from and writing to data memory
5. Using the system call interface to perform I/O


This lab will also help you to become familiar with the following important content knowledge in CS:
- Working in a RISC architecture
- Review basic programming concepts

## Taks 1: Print User Information

Your first task is to print a message that includes your name, assignment number, and a brief description of the program. 

Begin working in the file template (`ca.asm`) provided in the `ca` folder. 
```mips
# Data for the program goes here
.data

# Code goes here
.text
main:
	
	li $v0, 10		# 10 is the exit program syscall
	syscall			# execute call

## end of ca.asm
```
In the `.data` directive, declare a string with the information requested: name, assignment, and file description.
```mips
.data
name: .asciiz "Waldo Weber"

.text
main:
    # ...
	la $a0, name	# load address of name string into $a0
	li $v0, 4		# 4 is the print_string() syscall
	syscall			# execute call
    # ...
```
Now, repeat the previous step and display two more strings: 
- `hw` label for your assignment number: "Program Assignment #1"
- `info` label for your assignment information: "A program that adds two numbers"

Display all three strings to the screen
### Sample Output Task 1
![task1](images/task1.png)

## Task 2: Take user input
Your next task is to add code to compute and print the sum fo two numbers specified at runtime by the user. 

Use the following registers to hold your input values
```mips
# Registers used: 
#      $t0 - used to hold the first number.
#      $t1 - used to hold the second number.
#      $t2 - used to hold the sum of $t0 and $t1.
```
In your `main` procedure, use the `system call #5` to read an integer, then save/move the return value into a temporary register. In order to not confuse users, you will display a string asking the question to enter a number
```mips
##...
question1: .asciiz "Please enter a number: \n" 
##...
	la $a0, question1 	# load the address of q1 string into $a0
	li $v0, 4		# 4 is the print_string() syscall
	syscall			# execute call
	
    li $v0, 5		# load syscall read_int() into $v0
	syscall			# execute call
	move $t0, $v0	# move the number read into $t0
```
Now, repeat the steps to read the second number into `$t1`. Make sure you ask the question again. You may use the same `question1` string label you declared before. 

Next, using the `add` instruction, compute the sum of the values in `$t0` and `$t1` and store it in `$t2`.

Finally, display the value of `$t2`. To make the output more meaningful, declare another string label called `sum` and print it before the `$t2` value
```mips
##...
sum: .asciiz "\nThe sum is: "

##...
	la $a0, sum 	# load the address of sum string into $a0
	li $v0, 4		# 4 is the print_string() syscall
	syscall			# execute call

	move $a0, $t2	# move the number to print into $a0.
	li $v0, 1		# load the syscall print_int() into $v0
	syscall			# execute call
```
### Sample Output Task 2
![task2](images/task2.png)

## Task 3: Add an immediate value
The final task if to add the number `20` to your `$t2` register. For this use the add immediate (`addi`) instruction to add 20 to the current value of `$t2` and store it in `$t3`. Once again, you will display a new string before displaying your result.

Remember to document your register usage. 
```mips
# Registers used: 
##...
#      $t3 - used to hold the sum of $t2 and 20.
##...
sum2: .asciiz "\nThe new sum after adding 20 is: " 
##...
```
### Sample Output Task 3
![task3](images/task3.png)

## Submission Checklist
- [ ] Complete learning activities. Make sure you upload all the examples scripts we worked during the lectures to the **la/** folder in this project.
- [ ] Complete challenge activities
- [ ] Save and `commit` my code in github desktop
- [ ] `Push` the code to github.com
- [ ] Uploaded video of code walkthrough  in `Canvas`
- [ ] Add your github repo as a comment to your assignment in `Canvas`.
## Other Resources
For more information go to [How to page](HOWTO.md)
