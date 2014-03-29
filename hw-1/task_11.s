#working with different kinds of addresation. print the same number after this
	.data
int:
	.space 8
space:
	.space 8
address:
	.int 	0x00110012
in_int:
	.string "%d"
out_int:
	.string "%d\n"
	.text
	.globl main
main:
	pushl	%ebp 			#prolog
	movl	%esp,	%ebp

	pushl 	$int 
	pushl	$in_int
	call	scanf
	addl 	$8,	%esp

	movl	$space,	%ebx 
	movl	int,	%eax 
	movl	%eax,	space

	movl	$23,	%eax 		#Непосредственная адресация
	movl	(address),	%eax	#Прямая адресация (обычная)	
	movl	(%ebx),	%eax		#Косвенная адресация

	pushl	%eax 
	pushl	$out_int
	call	printf
	addl	$8,	%esp

	movl	%ebp,	%esp 		#epilog
	popl	%ebp
	movl	$0,	%eax 		#return 0
	ret
	
