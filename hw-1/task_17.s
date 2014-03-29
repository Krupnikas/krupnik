#program is a Pow() function using "for"; example 2 3 =>  2^3=8
	.data
out_string:
	.string "%d\n"
in_string:
	.string "%d %d"
int_space_a:
	.space 4
counter:
	.space 4
	.text
	.globl main
main:
	pushl %ebp		 #prolog
	movl %esp, %ebp

	pushl $counter
	pushl $int_space_a
	pushl $in_string
	call scanf


	movl int_space_a, %eax
	movl %eax, 4(%esp)
	movl $1, 8(%esp) 		#for started with i==1

umn:					#increasing result
	movl 4(%esp), %ebx
	imull %ebx
	addl $1, 8(%esp) 		#i++
proverka:
	movl 8(%esp), %ebx
	cmpl %ebx, counter 		#Checking of i<n
	jne umn

	pushl %eax
	pushl $out_string
	call printf
	addl $16, %esp	
	jmp contune

contune:
	movl %ebp, %esp #Epilog
	popl %ebp

	movl $0, %eax #return 0
	ret
