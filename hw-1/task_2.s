#Task 2 perevod otricatelnoe dec v dvoichnoe (dopoln. kod)

	.data
in:
	.string "%d"
int:
	.space 4
out:
	.string "\n"
	.text
	.globl main
main:
	pushl	%ebp		#prolog
	movl	%esp,	%ebp

	pushl	$int		#scanf
	pushl	$in
	call	scanf
	addl	$8,	%esp

	movl	int,	%eax	
	movl	$32,	%ecx 	#counter = 32
	movl	$0,	%edx	#prigoditsa dlya otbrosa nuley

shift:
	shll	$1,	%eax
	movl	$0,	%ebx
	jnc	print	#checking carry flag
	movl	$1,	%ebx
	movl	$1,	%edx 
print:
	cmpl	$1,	%edx
	jne	finish

	pushl	%edx		#edx, ecx, eax to stack
	pushl	%ecx
	pushl	%eax

	pushl	%ebx		#print next digit 
	pushl	$in
	call	printf
	addl	$8,	%esp

	popl	%eax		#edx, ecx, eax from stack
	popl	%ecx
	popl	%edx
finish:
	loop	shift

	pushl	$out
	call	printf
	addl	$4, %esp

	movl	%ebp,	%esp	#epilog
	popl	%ebp

#	movl	$0,	%eax	#return 0
ret
