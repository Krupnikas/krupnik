	.data

int_1:
        .space 4

scan:
        .string "%d"

print:
	.string "%d\n"

	.text
	.globl main

main:
        pushl %ebp
        movl %esp, %ebp

        pushl $int_1
        pushl $scan
        call scanf
        addl $8, %esp

        movl int_1, %ecx
        movl $0, %eax

label:

        addl %ecx, %eax

        loop label

        pushl %eax
        pushl $print
        call printf
        addl $12, %esp

        movl $0, %eax

        movl %ebp, %esp
        popl %ebp

        ret
