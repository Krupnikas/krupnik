	.data
d:
        .space 8
scan:
        .string "%lf"
print:
        .string "%d"
print_2:
        .string "\n"

        .text
        .globl main
main:
        pushl %ebp		#prolog
        movl %esp, %ebp
       
	pushl $d
        pushl $scan
        call scanf
        addl $8, %esp
        
	pushl %ebx
        movl $4, %eax
        addl $d,%eax
        
	movl (%eax), %ebx
        movl %ebx, %eax
        popl %ebx
        movl $64, %ecx
do:
        cmpl $32, %ecx
        jne l_1
        movl $d, %eax
        
	pushl %ebx
        
	movl (%eax), %ebx
        movl %ebx, %eax
        popl %ebx
l_1:
        shll $1, %eax
        movl $0, %ebx
        jnc l_2
        movl $1, %ebx
l_2:
        pushl %edx
        pushl %ecx
        pushl %eax
        pushl %ebx
        pushl $print
        call printf
        addl $8, %esp
       
	popl %eax
        popl %ecx
        popl %edx
        
	loop do
        
	pushl $print_2
        call printf
        addl $4, %esp
        
	movl %ebp, %esp		#epilog
        popl %ebp
        
	movl $0, %eax		#return 0
        
	ret
