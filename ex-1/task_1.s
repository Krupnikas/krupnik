#На вход поступает строка, заканчивающаяся символом переноса строки. На выходе - число - количество символов в строке.
	.data
printf_format:
	.string "%u\n"

str_in:
	.space 2048
string:
	.string "%s"
	.text

my_strlen:

	pushl %ebp
	movl  %esp, %ebp

	pushl $str_in
	pushl $string
	call scanf
	addl $8, %esp

	pushl %edi

	movl 8(%ebp), %edi 

	movl $0xffffffff, %ecx 
	xorl %eax, %eax 

	repne scasb

	notl %ecx
	decl %ecx

	movl %ecx, %eax

	popl %edi

	movl %ebp, %esp
	popl %ebp
	
	ret 

.globl main

main:

	pushl %ebp
	movl %esp, %ebp

	pushl $str_in
	call my_strlen

	pushl %eax
	pushl $printf_format
	call printf

	movl $0, %eax

	movl %ebp, %esp
	popl %ebp

ret
