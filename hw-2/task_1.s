	.file	"task_1.c"
	.text
.globl pow
	.type	pow, @function
pow:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -28(%ebp)
	fldl	-24(%ebp)
	fstpl	-8(%ebp)
	fld1
	fstpl	-16(%ebp)
	jmp	.L2
.L3:
	fldl	-8(%ebp)
	fmull	-24(%ebp)
	fstpl	-8(%ebp)
	fldl	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstpl	-16(%ebp)
.L2:
	fldl	-16(%ebp)
	fldl	-32(%ebp)
	fucompp
	fnstsw	%ax
	testb	$69, %ah
	sete	%al
	testb	%al, %al
	jne	.L3
	fldl	-8(%ebp)
	leave
	ret
	.size	pow, .-pow
	.section	.rodata
.LC2:
	.string	"%lf"
.LC5:
	.string	"%lf\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	movl	$.LC2, %eax
	leal	24(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	fldl	24(%esp)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	setae	%al
	testb	%al, %al
	je	.L6
	fldl	24(%esp)
	fstpl	8(%esp)
	fldl	.LC4
	fstpl	(%esp)
	call	pow
	movl	$.LC5, %eax
	fstpl	4(%esp)
	movl	%eax, (%esp)
	call	printf
	jmp	.L7
.L6:
	fldl	24(%esp)
	fldl	.LC4
	fstpl	8(%esp)
	fstpl	(%esp)
	call	pow
	movl	$.LC5, %eax
	fstpl	4(%esp)
	movl	%eax, (%esp)
	call	printf
.L7:
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1073741824
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
