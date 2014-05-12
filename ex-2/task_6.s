	.data
fmt_s:
	.string	"%s"
	.text
.globl main

main:
	pushl	%ebp
	movl	%esp, %ebp 	#Prolog

	andl	$-16, %esp
	pushl	%ebx
	subl	$300, %esp
	movl	$0, 280(%esp)
	movl	$0, 284(%esp)
	movl	$fmt_s, %eax
	leal	23(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	scanf
	jmp	Next
Per:
	addl	$1, 284(%esp)
Next:
	movl	284(%esp), %eax
	movzbl	23(%esp,%eax), %eax
	testb	%al, %al
	jne	Per
	subl	$1, 284(%esp)
	movl	$0, 280(%esp)
	jmp	Contune
Change:
	movl	280(%esp), %eax
	movzbl	23(%esp,%eax), %eax
	movb	%al, 279(%esp)
	movl	280(%esp), %eax
	movl	280(%esp), %edx
	movl	284(%esp), %ecx
	movl	%ecx, %ebx
	subl	%edx, %ebx
	movl	%ebx, %edx
	movzbl	23(%esp,%edx), %edx
	movb	%dl, 23(%esp,%eax)
	movl	280(%esp), %eax
	movl	284(%esp), %edx
	subl	%eax, %edx
	movzbl	279(%esp), %eax
	movb	%al, 23(%esp,%edx)
	addl	$1, 280(%esp)
Contune:
	movl	284(%esp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	leal	(%edx,%eax), %eax
	sarl	%eax
	cmpl	280(%esp), %eax
	jg	Change
	leal	23(%esp), %eax
	movl	%eax, (%esp)
	call	puts
	movl	$0, %eax
	addl	$300, %esp
	popl	%ebx

	movl	%ebp, %esp		#Epilog
	popl	%ebp

	ret
