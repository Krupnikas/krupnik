	.data
int_1:
        .space 4
int_2:
        .space 4
scan:
        .string "%d"
print:
        .string "%d\n"

        .text
        .globl main
main:
        pushl	 %ebp			#prolog
        movl	 %esp,	 %ebp

        pushl	 $int_1
        pushl	 $scan
        call	 scanf
        addl	 $8,	 %esp

        pushl	 $int_2
        movl	 $0,	 %eax
        movl	 %eax, int_2
        movl	 int_1,	 %eax

l_1:
        movl 	 $10,	 %ebx
        idiv	 %ebx

        pushl	 %eax
        movl	 int_2,	 %eax
        addl  	 $1,	 %eax
        movl	 %eax, 	 int_2
        popl	 %eax
        movl	 $0,	 %edx
        cmpl	 $0,	 %eax

        jne l_1

        movl	 int_2,	 %eax
        pushl	 %eax
        pushl	 $print
        call printf
        addl	 $12,	 %esp

        movl	 %ebp,	 %esp		#epilog
        popl	 %ebp

        movl $0, %eax			#return 0

        ret
