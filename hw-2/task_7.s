#задача 2.6.6 Программа получает строку без пробелов и если строка начинается и кончается разными цифрами, то заглавные латинские букы меняются на симметричные, а иначе удаляются все повторяющиеся символы. 
	.data
.LC0:
	.string	"%s"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp	#prolog
	movl	%esp, %ebp

	andl	$-16, %esp
	pushl	%edi
	pushl	%ebx
	subl	$152, %esp
	leal	28(%esp), %ebx
	movl	$0, %eax
	movl	$25, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx

	rep stosl

	movl	$0, 136(%esp)
	movl	$.LC0, %eax
	leal	28(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	jmp	.L2
.L3:
	addl	$1, 136(%esp)
.L2:
	movl	136(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	testb	%al, %al
	jne	.L3
	movzbl	28(%esp), %eax
	cmpb	$47, %al
	jle	.L4
	movzbl	28(%esp), %eax
	cmpb	$57, %al
	jg	.L4
	movl	136(%esp), %eax
	subl	$1, %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$47, %al
	jle	.L4
	movl	136(%esp), %eax
	subl	$1, %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$57, %al
	jg	.L4
	movzbl	28(%esp), %edx
	movl	136(%esp), %eax
	subl	$1, %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	%al, %dl
	je	.L4
	movl	$0, 128(%esp)
	jmp	.L5
.L7:
	movl	128(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$64, %al
	jle	.L6
	movl	128(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$90, %al
	jg	.L6
	movl	128(%esp), %eax
	movl	128(%esp), %edx
	movzbl	28(%esp,%edx), %edx
	movl	$-101, %ecx
	movl	%ecx, %ebx
	subb	%dl, %bl
	movl	%ebx, %edx
	movb	%dl, 28(%esp,%eax)
.L6:
	addl	$1, 128(%esp)
.L5:
	movl	128(%esp), %eax
	cmpl	136(%esp), %eax
	jl	.L7
	jmp	.L8
.L4:
	movl	$0, 128(%esp)
	movl	$1, 132(%esp)
	jmp	.L9
.L11:
	movl	128(%esp), %eax
	movzbl	28(%esp,%eax), %edx
	movl	132(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	%al, %dl		#comparing of symbols
	jne	.L10
	addl	$1, 132(%esp)
	jmp	.L9
.L10:
	addl	$1, 128(%esp)
	movl	128(%esp), %eax
	movl	132(%esp), %edx
	movzbl	28(%esp,%edx), %edx
	movb	%dl, 28(%esp,%eax)
.L9:
	movl	132(%esp), %eax
	cmpl	136(%esp), %eax
	jl	.L11
	addl	$1, 128(%esp)
	jmp	.L12
.L13:
	movl	128(%esp), %eax
	movb	$0, 28(%esp,%eax)
	addl	$1, 128(%esp)
.L12:
	movl	128(%esp), %eax
	cmpl	136(%esp), %eax
	jl	.L13
.L8:
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	puts
	movl	$0, %eax
	addl	$152, %esp
	popl	%ebx
	popl	%edi

	movl	%ebp, %esp #epilog
	popl	%ebp

	ret
