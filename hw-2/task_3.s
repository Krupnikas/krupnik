	.file	"task_3.c"
	.text
.globl sum
	.type	sum, @function
sum:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	fldz
	fstpl	-16(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	sall	$3, %eax
	addl	8(%ebp), %eax
	fldl	(%eax)
	fldl	-16(%ebp)
	faddp	%st, %st(1)
	fstpl	-16(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L3
	fldl	-16(%ebp)
	leave
	ret
	.size	sum, .-sum
	.section	.rodata
.LC2:
	.string	"%d"
.LC3:
	.string	"%lf"
.LC4:
	.string	"%lf\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$432, %esp
	movl	$.LC2, %eax
	leal	424(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	movl	$0, 428(%esp)
	jmp	.L6
.L7:
	movl	428(%esp), %eax
	leal	0(,%eax,8), %edx
	leal	24(%esp), %eax
	addl	%edx, %eax
	movl	$.LC3, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__isoc99_scanf
	addl	$1, 428(%esp)
.L6:
	movl	424(%esp), %eax
	cmpl	%eax, 428(%esp)
	jl	.L7
	movl	424(%esp), %eax
	movl	%eax, 4(%esp)
	leal	24(%esp), %eax
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
