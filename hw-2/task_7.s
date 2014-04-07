	.data
printf_format:
	.string "%s\n"
str_in:
	.string "abc123()!@!777"
	.set str_in_length, .-str_in
	.bss
str_out:
	.space str_in_length
	.text
	.globl main
main:
	pushl %ebp
	movl %esp, %ebp

	movl $str_in, %esi
	movl $str_out, %edi

	movl $str_in_length - 1, %ecx
1:
	lodsb

	cmpl $77, %al
	jg AZ
	jmp ZA

AZ:	
	movl %al,  %eax
	subl $65,  %eax
	movl %eax, %edx
	movl $90,  %eax
	subl %edx, %eax
	movl %eax, %al	

	jmp contune

ZA: 	
        movl $90,  %eax
        subl %al,  %eax
        movl %eax, %edx
        movl $65,  %eax
        addl %edx, %eax 
        movl %eax, %al


contune:
	stosb

	loop 1b

	movsb


	pushl $str_out
	pushl $printf_format
	call printf

	movl $0, %eax

	movl %ebp, %esp
	popl %ebp

	ret 
