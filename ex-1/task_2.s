	.data
int_1:
	.space 8
int_2:
	.space 8
perebor_string:
	.string "2^32+%d\n"
string:
	.string "%d\n"
scan:
	.string "%d %d"
	.text
	.globl main

main:
	pushl %ebp
	movl  %esp, %ebp 

	pushl $int_2
        pushl $int_1			#Чтение
        pushl $scan
        call scanf	
        addl $8, %esp

        movl int_1, %eax		#Попробуем сложить
        addl int_2, %eax

	cmp  $0, %eax
	jng perebor

	pushl %eax
	pushl $string
	call printf
	addl $4, %esp
	jmp contune

perebor: 
	movl int_1, %eax
        subl $2147483648, %eax
        movl int_2, %ebx
        subl $2147483648, %ebx       	#Вычтем (2^32)/2 из каждого и снова сложим.
	addl %ebx, %eax

	pushl %eax
        pushl $perebor_string
        call printf
        addl $4, %esp

contune:

	movl %ebp, %esp	
	popl %ebp

	movl $0, %eax
	ret
