	.data
printf_format:
	.string "%s\n"
str_in:
	.string "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
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

#	cmpb $65, %al 			#Проверка, является ли символ заглавной буквой?
#	jg contune
	
#	cmpb $90, %al
#	jl contune

	cmpb $77, %al			#Смена буквы на симметричную. Начало.
	jg AZ
	jmp ZA

AZ:	
	subl $65,  %eax
	movl %eax, %edx
	movl $90,  %eax
	subl %edx, %eax	

	jmp contune

ZA: 	
        movl $90,  %edx
        subl %eax, %edx
        movl $65,  %eax
        addl %edx, %eax 		#Смена буквы на симметричную. Конец.


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
