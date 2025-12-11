	.file	"exercise7.c"
	.text
	.globl	imax
	.type	imax, @function
imax:
    pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
    movl    %edi, -4(%rbp)      ; first int parameter: x
    movl    %esi, -8(%rbp)      ; second int parameter: y
    movl    -4(%rbp), %eax      ; %eax = x
    compl   -8(%rbp), %eax      ; COMPARE %eax with y: x with y
    jl  .L2                     ; JUMP TO L2 if x < y
    movl    -4(%rbp), %eax      ; %eax = x (final return)
    jmp .L3                     ; JUMP TO L3 (no condition/comparison)
.L2:
    movl    -8(%rbp), %eax      ; %eax = y (final return)
.L3:
    leave
    ret
    .size	imax, .-imax
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-10)"
	.section	.note.GNU-stack,"",@progbits