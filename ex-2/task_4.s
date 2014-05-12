	.data
	.comm str_1,101,32 
	.comm str_2,101,32 
	.comm str_new, 201,32 
length1:
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

	pushl $str_1
	pushl $str_in	#Прочитали первую строку
	call scanf

	pushl $str_2
	pushl $str_in	#вторую строку
	call scanf

	pushl $v
	pushl $num_in	#и номер
	call scanf

 	addl $24, %esp

	movl $str_1, %esi
	movl $0, %ecx
l_1: 		 #Найдем длину первой строки
	lodsb
	cmp $0, %al
	je break_1
	addl $1, %ecx
	jmp l_1
break_1:
	movl %ecx, length1  

	movl $str_new, %edi
	movl v, %ecx
	subl $1, %ecx
	movl $str_2, %esi #поместим вторую строку в новую
	movl %esi, v 
	cmp $0, %ecx      #если с первой позиции, то ставим строки поочереди и цикл не нужен
	je contune 

begining_of_2_str:	               #если не с первой, то идем циклом до нужной, затем вставляем
	pushl %ecx
	movsb
	popl %ecx
	loop begining_of_2_str
	movl %esi, v 

contune:
	movl length1, %ecx #Всю строку 2 в новую без символа конца строки
	movl $str_1, %esi
loop_2:
	pushl %ecx
	movsb
	popl %ecx
	loop loop_2

	movl v, %esi   
end_of_str_2:
	lodsb
	stosb
	cmp $0, %al   	#Дописываем остаток
	je print    
	jmp end_of_str_2

print:
	pushl $str_new	
	pushl $str_out	
	call printf    

	pushl $print_ln
	call printf
	addl $12, %esp

        movl %ebp, %esp   #epilog
        popl %ebp

        movl $0, %eax   #return 0

        ret
