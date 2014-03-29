#program is scanning different types and print them in other order
	.data
in_int:
	.string "%d"
in_char:
	.string "%d"
in_float:
	.string "%f"
out_int:
	.string "Int: %d\n"
out_char:
	.string "Char: %c\n"
out_float:
	.string "Real: %f\n"
	.comm 	a,4,4
	.comm	c,1,1
	.comm	b,4,4
	.text
	.globl	main

main:
	pushl	%ebp 		#prolog
	movl	%esp, %ebp

	pushl	$a 		#scan int
	pushl	$in_int
	call	scanf
	addl 	$8,	%esp

	pushl	$c 		#scan char
	pushl	$in_char
	call	scanf
	addl	$8,	%esp

	pushl	$b 		#scan float
	pushl	$in_float
	call	scanf
	addl	$8,	%esp

        movl    c,      %eax    #print char
        pushl   %eax
        pushl   $out_char
        call    printf
        addl    $8,     %esp

	movl	a,	%eax 	#print int
	pushl	%eax
	pushl	$out_int
	call  	printf
	addl	$8,	%esp

	andl	$-4,	%esp 	#print float
	subl	$4,	%esp
	flds	b
	fstpl	(%esp)
	pushl	$out_float
	call 	printf
	addl	$8,	%esp

	movl 	%ebp,	%esp 	#epilog
	popl 	%ebp
	movl	$0, 	%eax 	#return 0
	ret
