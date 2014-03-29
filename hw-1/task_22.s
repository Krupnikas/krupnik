	.data
person:
        .space 36
s:
        .string "%s"
d:
        .string "%d"
print:
        .string "%d\n"

        .text
        .globl main
main:
        pushl %ebp
        movl %esp, %ebp

        pushl $person
        pushl $s
        call scanf

        pushl $person+14
        pushl $s
        call scanf

        pushl $person+28
        pushl $d
        call scanf

        movl $person, (%esp)
        call puts

        movl $person+14, (%esp)
        call puts

        movl person+28, %edx
        pushl %edx
        pushl $print
        call printf

        movl $0, %eax

        movl %ebp, %esp
        popl %ebp

        ret
