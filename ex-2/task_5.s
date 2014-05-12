	.data
	.comm str,101,32  
	.comm str_new, 101,32
number:				
	.space 4
v:
	.space 4
str_in:
	.string "%s"
num_in:
	.string "%d"
str_out:
	.string "%s"
print_ln:
	.string "\n"

	.text
	.globl main
main:
        pushl %ebp
        movl %esp, %ebp  #prolog

	pushl $str
	pushl $str_in #Считали строку
	call scanf

	pushl $v
	pushl $num_in #И два
	call scanf

	pushl $number
	pushl $num_in
	call scanf	#числа
 	addl $24, %esp

	movl $str_new, %edi
	movl $str, %esi
	movl v, %ecx
	subl $1, %ecx
	cmp $0, %ecx
	je next

loop_1:
	pushl %ecx
	movsb
	popl %ecx
	loop loop_1

next:
	addl number, %esi
l_1:
	lodsb
	stosb
	cmp $0, %al
	je print
	jmp l_1

print:
	pushl $str_new	
	pushl $str_out	
	call printf   

	pushl $print_ln
	call printf
	addl $12, %esp


        movl %ebp, %esp   #epilog
        popl %ebp

        movl $0, %eax

        ret
