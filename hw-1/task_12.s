#Read 2 numbers, then pint +, -, *, /
	.data
del:
pushl %ebp #Prolog
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
	movl %eax,%edx
	sarl $31, %edx
        idivl %ebx
        popl %ebx


        movl %ebp, %esp #Epilog
        popl %ebp
        ret
int_1:
        .space 4
int_2:
        .space 4
out_string:
        .string "%d\n"
scan:
        .string "%d %d"

.text
.globl del, main
main:
        pushl %ebp		#prolog
        movl %esp, %ebp

	pushl $int_2
        pushl $int_1	#read 2 numbers
        pushl $scan
        call scanf	
        addl $8, %esp

        movl int_1, %eax
        addl int_2, %eax	#+
        pushl %eax
        pushl $out_string
        call printf
        addl $8, %esp

        movl int_1, %eax
        subl int_2, %eax	#-
        pushl %eax
        pushl $out_string
        call printf
        addl $8, %esp

        movl int_1, %eax
        mull int_2		#*
        pushl %eax
        pushl $out_string
        call printf
        addl $8, %esp
	
	pushl int_2
	pushl int_1
	call del
	addl $8, %esp

	pushl %eax
	pushl $out_string
	call printf
	addl $8, %esp
	

        movl %ebp, %esp		#epilog
        popl %ebp
      
        movl $0, %eax

	ret
