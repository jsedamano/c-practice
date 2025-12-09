	.file	"part-4.c"
	.text
	.globl	curious
	.type	curious, @function
curious:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	movl	%edi, -20(%rbp)		; first int parameter: x
	movl	$0, -4(%rbp)		; a = 0
	movl	$10, -8(%rbp)		; b = 10
.L4:
	movl	-20(%rbp), %eax		; %eax = x
	addl	%eax, %eax			; %eax = x + x
	cmpl	$9, %eax			; COMPARE %eax with 9: (2 * x) with 9
	jg	.L2						; JUMP TO L2 if (2 * x) > 9
	addl	$1, -4(%rbp)		; a = a + 1
	jmp	.L3						; JUMP TO L3 (no condition/comparison)
.L2:
	subl	$4, -20(%rbp)		; x = x - 4
.L3:
	subl	$1, -8(%rbp)		; b = b - 1
	cmpl	$0, -8(%rbp)		; COMPARE b with 0
	jg	.L4						; JUMP TO L4 if b > 0
	movl	-20(%rbp), %eax		; %eax = x (final return)
	leave
	ret
	.size	curious, .-curious
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits