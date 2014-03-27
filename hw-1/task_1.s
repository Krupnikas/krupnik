#Task 1. Perevod polozhitelnogo dec chisla v dvoichnoe
	.data
int_label:
	.space 4
format_string_input:
	.string "%d"
format_string_output:
	.string "%d\n"
	.text
	.globl main
perevod:
	movl $2, %ebx	
	idiv %ebx
	pushl %edx
	movl $0, %edx
	addl $1, %ecx
	cmp $0, %eax
	jne perevod
	movl $0, %eax
	jmp next	
main:
	pushl %ebp		#prolog
	movl %esp, %ebp

	pushl	$int_label 	#scanf
	pushl	$format_string_input
	call	scanf
	addl $8, %esp

	movl	int_label, %eax	
	movl $0, %ecx

	cmp $0, %eax
	jne perevod
	pushl %eax
	movl $0, %ecx
	jmp next
next:
	popl %ebx 
	movl $10, %edx 		#zapis sled. cifry
	imul %edx  	
	addl %ebx, %eax
	loop next

	pushl	%eax 		#printf
	pushl	$format_string_output
	call	printf
	addl	$8, %esp

	movl %ebp, %esp		#epilog
	popl %ebp

	movl $0, %eax #return 0
	ret
