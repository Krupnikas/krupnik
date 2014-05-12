	.data

	.comm string1,101,32  
	.comm string2,101,32  

length1:				
	.space 4
length2:
	.space 4
v:
	.space 4
str_in:
	.string "%s"
str_out:
	.string "%d\n"

	.text
	.globl main
main:
        pushl %ebp
        movl %esp, %ebp  	#prolog

	pushl $string1
	pushl $str_in		#Считали первую строку
	call scanf

	pushl $string2
	pushl $str_in		#считали вторую строку
	call scanf

	addl $16, %esp
	movl $-1, v

	movl $string1, %esi
	movl $0, %ecx
label_1:  			
	lodsb
	cmp $0, %al		#найдем длину первой строки
	je break_1
	addl $1, %ecx
	jmp label_1
break_1:
	movl %ecx, length1

        movl $string2, %esi
        movl $0, %ecx
label_2:  		
        lodsb			#найдем длину второй строки
        cmp $0, %al
        je break_2
        addl $1, %ecx
        jmp label_2
break_2:
        movl %ecx, length2

	movl length2, %ecx
	movl length1, %eax
	subl %eax, %ecx
	cmp $0, %ecx   		#Если вторая короче первой, то в ней нет первой
	jl finish      
	addl $1, %ecx  

loop_label:	
	subl $1, %ecx  
	pushl %ecx
	movl $string2, %esi	#Сравниваем каждый раз с нового места символы
	movl $string1, %edi
	addl %ecx, %esi
	movl length1, %ecx
	loop_in:
		pushl %ecx 
		cmpsb   
		popl %ecx
		jne break_in   
		loop loop_in
	popl %ecx
	movl %ecx, v
	pushl v
break_in:
	popl %ecx
	addl $1, %ecx  #back %ecx - v
	loop loop_label

finish:
	addl $1, v
	pushl v
	pushl $str_out
	call printf   
	addl $8, %esp

        movl %ebp, %esp   #epilog
        popl %ebp

        movl $0, %eax		#return 0

        ret
