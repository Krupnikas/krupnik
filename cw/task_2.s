	.data
int_label:
	.long 321
string1:
	.string "Hello"
string2:
	.string "%s %d\n"
	.text
	.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl int_label 
	pushl $string1
	pushl $string2
	call printf

	movl %ebp, %esp
	popl %ebp
	ret	
