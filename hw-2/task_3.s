	.file	"task_3.c"
	.text
.globl function
	.type	function, @function
function:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0x00000000, %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L3
	movl	-8(%rbp), %eax
	movl	%eax, -36(%rbp)
	movss	-36(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	function, .-function
	.section	.rodata
.LC5:
	.string	"%f"
	.text
.globl main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0x3f800000, %eax
	movl	%eax, -32(%rbp)
	movl	$0x3f800000, %eax
	movl	%eax, -28(%rbp)
	movl	$0x40000000, %eax
	movl	%eax, -24(%rbp)
	movl	$0x40400000, %eax
	movl	%eax, -20(%rbp)
	movl	$0x40a00000, %eax
	movl	%eax, -16(%rbp)
	movl	$5, -4(%rbp)
	movl	-4(%rbp), %edx
	leaq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	function
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC5, %eax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-3)"
	.section	.note.GNU-stack,"",@progbits
