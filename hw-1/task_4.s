	.data
int:
        .space  4
hex_string:
        .string "%x"
dec_string:
        .string "%d"
print:
        .string "\n"

        .text
        .globl  main
        .globl  func

main:
        pushl   %ebp
        movl    %esp,   %ebp	#prolog

        pushl   $int
        pushl   $hex_string
        call    scanf
        addl    $8,     %esp

        pushl   int
        pushl   $32
        call    func
        addl    $8,     %esp

        pushl   $print
        call printf
        addl    $4,     %esp

        movl    %ebp,   %esp	#epilog
        popl    %ebp

        movl    $0,     %eax

        ret

func:
        pushl   %ebx
        pushl   %ecx
        pushl   %edx
        pushl   %ebp
        movl    %esp,   %ebp
        movl 20(%ebp),  %ecx
        movl 24(%ebp),  %ebx
        movl 20(%ebp),  %ecx

l_1:
        movl    $1,     %edx
        rorl    $1,     %ebx
        jc      one
        movl    $0,     %edx
        one:
        pushl   %edx
        loop l_1
        movl 20(%ebp),  %ecx

l_2:
        movl    %ecx,   %ebx
        pushl $dec_string
        call printf
        addl    $8,     %esp
        movl    %ebx,   %ecx
        loop l_2

        movl    %ebp,   %esp
        popl    %ebp
        popl    %edx
        popl    %ecx
        popl    %ebx
        ret
