	.file	"exercise8.c"
	.text
	.globl	arith
	.type	arith, @function
arith:
    pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
    movl    %edi, -20(%rbp)     ; first int parameter: x
    movl    %esi, -24(%rbp)     ; second int parameter: y
    movl    %edx, -28(%rbp)     ; third int parameter: z
    movl    -20(%rbp), %edx     ; %edx = x
    movl    -24(%rbp), %eax     ; %eax = y
    addl    %edx, %eax          ; %eax = y + x
    movl    %eax, -4(%rbp)      ; t1 = y + x
    movl    -28(%rbp), %edx     ; %edx = z
    movl    %edx, %eax          ; %eax = z
    addl    %eax, %eax          ; %eax = z * 2
    addl    %edx, %eax          ; %eax = z * 2 + z = z * 3
    sall    $4, %eax            ; %eax = z * 3 << 4 = z * 3 * 16 = z * 48
    movl    %eax, -8(%rbp)      ; t2 = z * 48
    movl    -4(%rbp), %eax      ; %eax = t1 (y + x)
    movzwl  %ax, %eax           ; (zero-extend lower 16 bits of t1) %eax = (y + x) & 0xFFFF
    movl    %eax, -12(%rbp)     ; t3 = (y + x) & 0xFFFF
    movl    -8(%rbp), %eax      ; %eax = t2
    imull   -12(%rbp), %eax     ; %eax = t2 * t3
    movl    %eax, -16(%rbp)     ; t4 = t2 * t3
    movl    -16(%rbp), %eax     ; %eax = t4 (final return)
    leave
    ret
    .size	arith, .-arith
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-10)"
	.section	.note.GNU-stack,"",@progbits