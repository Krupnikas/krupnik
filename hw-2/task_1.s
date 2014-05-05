	.file	"task_1.c"
	.section	.rodata
.LC0:
	.string	"%lf"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$.LC0, %eax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movsd	-8(%rbp), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	setae	%al
	testb	%al, %al
	je	.L2
	movsd	-8(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	call	pow
	movsd	%xmm0, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movl	$.LC0, %eax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf
	jmp	.L3
.L2:
	movsd	-8(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	call	pow
	movl	$.LC0, %eax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf
.L3:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-3)"
	.section	.note.GNU-stack,"",@progbits
