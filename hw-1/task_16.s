#Программа сравнивает числа и выводит знак >, <, или =
	.data
bigger_string:
	.string ">\n"
lower_string:
	.string "<\n"
equal_string:
	.string "=\n"
int_string:
	.string "%d %d"
int_space_a:
	.space 4
int_space_b:
	.space 4
	.text
	.globl main
main:
	pushl %ebp 			#prolog
	movl %esp, %ebp

	pushl $int_space_b 
	pushl $int_space_a
	pushl $int_string
	call scanf
	addl $8, %esp

	pushl %ebx 			#saving ebx and eax
	pushl %eax

	movl int_space_a, %eax
	movl int_space_b, %ebx

	cmp %ebx, %eax
	je equal 			#Chouse <, >, or = (switch)

	cmp %ebx,%eax
	jg bigger

	cmp %eax, %ebx
	jg lower

equal:
	pushl $equal_string 		#Print =
	call printf
	addl $4, %esp
	jmp contune

bigger:
	pushl $bigger_string		#Print >
	call printf
	addl $4, %esp
	jmp contune

lower:
	pushl $lower_string		#Print <
	call printf
	addl $4, %esp

contune:	
	popl %eax
	popl %ebx

	movl %ebp, %esp			#epilog
	popl %ebp

	movl $0, %eax #return 0
	ret
