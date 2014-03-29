#comparing of two numbers
	.data
firstisbigger_string:
	.string "First is bigger or equal\n"
secondisbigger_string:
	.string "Second is bigger\n"
int_string:
	.string "%d %d"
int_space_a:
	.space 4
int_space_b:
	.space 4
	.text
	.globl main
main:
	pushl %ebp 			#prolog	
	movl %esp, %ebp

	pushl $int_space_b 
	pushl $int_space_a
	pushl $int_string
	call scanf
	addl $8, %esp

	pushl %ebx 			#saving ebx and eax
	pushl %eax

	movl int_space_a, %eax
	movl int_space_b, %ebx

	cmp %ebx, %eax
	jge firstisbigger		#If the first is bigger than the second or equal go to firstisbigger
	pushl $secondisbigger_string 	#Print if second is bigger than the first
	call printf
	addl $4, %esp
	jmp contune

firstisbigger:
	pushl $firstisbigger_string 
	call printf
	addl $4, %esp

contune: 					
	popl %eax
	popl %ebx

	movl %ebp, %esp 		#epilog
	popl %ebp

	movl $0, %eax 		#return 0
	ret
