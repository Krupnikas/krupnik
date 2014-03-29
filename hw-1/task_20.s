
.globl  a
        .data

a:
        .space 12

scan:
        .string "%d"

print:
        .string "%d\n"

int_1:
        .space 4

i:
        .space 4

        .text
        .globl  main
main:

        pushl %ebp
        movl %esp, %ebp

        movl $0,%eax
        movl %eax, i
   
	jmp l_1

begin:

        movl i, %eax
        sall $2, %eax
        addl $a, %eax
        pushl  %eax
        pushl $scan
        call scanf
        addl $8, %esp
       
	movl i, %eax
        addl $1, %eax
        movl %eax, i
l_1:
        movl i, %eax
        cmpl $2, %eax
        
	jle begin
        
	movl a, %eax
        movl %eax, int_1
        movl $1, %eax
        movl %eax, i
        jmp l_2

check:
        movl i, %eax
        sall $2, %eax
        addl $a, %eax
       
	movl (%eax), %edx
        movl %edx, %eax
        movl int_1, %ebx
        cmpl %ebx, %eax

        js l_2
        
	jmp l_3

l_2:
        movl %eax, int_1

l_3:
        movl i, %eax
        addl $1, %eax
        movl %eax, i
l_4:
        movl i, %eax
        cmpl $2, %eax

        jle check

        movl int_1, %eax
        pushl %eax
        pushl $print
        call printf
        addl $8, %esp

        movl %ebp, %esp	
        popl %ebp

        movl $0, %eax

        ret
