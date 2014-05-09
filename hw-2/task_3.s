	.file	"task_3.c"
	.text
.globl sum
	.type	sum, @function
sum:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	$0x00000000, %eax
	movl	%eax, -8(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	flds	(%eax)
	flds	-8(%ebp)
	faddp	%st, %st(1)
	fstps	-8(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L3
	movl	-8(%ebp), %eax
	movl	%eax, -20(%ebp)
	flds	-20(%ebp)
	leave
	ret
	.size	sum, .-sum
	.section	.rodata
.LC2:
	.string	"%d"
.LC3:
	.string	"%f"
.LC4:
	.string	"%f\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$224, %esp
	movl	$.LC2, %eax
	leal	216(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	movl	$0, 220(%esp)
	jmp	.L6
.L7:
	movl	220(%esp), %eax
	leal	0(,%eax,4), %edx
	leal	16(%esp), %eax
	addl	%edx, %eax
	movl	$.LC3, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__isoc99_scanf
	addl	$1, 220(%esp)
.L6:
	movl	216(%esp), %eax
	cmpl	%eax, 220(%esp)
	jl	.L7
	movl	216(%esp), %eax
	movl	%eax, 4(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	call	sum
	movl	$.LC4, %eax
	fstpl	4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
