#задача 2.6.6 Программа получает строку без пробелов и если строка начинается и кончается разными цифрами, то заглавные латинские букы меняются на симметричные, а иначе удаляются все повторяющиеся символы. 
	.data
str_in:
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
	movl	$str_in, %eax
	leal	28(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	scanf
	jmp	start
correct:
	addl	$1, 136(%esp)
start:
	movl	136(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	testb	%al, %al
	jne	correct
	movzbl	28(%esp), %eax
	cmpb	$47, %al
	jle	per
	movzbl	28(%esp), %eax
	cmpb	$57, %al
	jg	per
	movl	136(%esp), %eax
	subl	$1, %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$47, %al
	jle	per
	movl	136(%esp), %eax
	subl	$1, %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$57, %al
	jg	per
	movzbl	28(%esp), %edx
	movl	136(%esp), %eax
	subl	$1, %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	%al, %dl
	je	per
	movl	$0, 128(%esp)
	jmp	comp
ch:
	movl	128(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$64, %al
	jle	corr				#
	movl	128(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	$90, %al
	jg	corr          			#
	movl	128(%esp), %eax
	movl	128(%esp), %edx
	movzbl	28(%esp,%edx), %edx
	movl	$-101, %ecx
	movl	%ecx, %ebx
	subb	%dl, %bl
	movl	%ebx, %edx
	movb	%dl, 28(%esp,%eax)
corr:
	addl	$1, 128(%esp)
comp:
	movl	128(%esp), %eax
	cmpl	136(%esp), %eax
	jl	ch
	jmp	end
per:
	movl	$0, 128(%esp)
	movl	$1, 132(%esp)
	jmp	corr
comparing:
	movl	128(%esp), %eax
	movzbl	28(%esp,%eax), %edx
	movl	132(%esp), %eax
	movzbl	28(%esp,%eax), %eax
	cmpb	%al, %dl		#comparing of symbols
	jne	sp
	addl	$1, 132(%esp)
	jmp	cont
sp:
	addl	$1, 128(%esp)
	movl	128(%esp), %eax
	movl	132(%esp), %edx
	movzbl	28(%esp,%edx), %edx
	movb	%dl, 28(%esp,%eax)
cont:
	movl	132(%esp), %eax
	cmpl	136(%esp), %eax
	jl	comparing
	addl	$1, 128(%esp)
	jmp	next
rep:
	movl	128(%esp), %eax
	movb	$0, 28(%esp,%eax)
	addl	$1, 128(%esp)
next:
	movl	128(%esp), %eax
	cmpl	136(%esp), %eax
	jle  	rep
end:
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
