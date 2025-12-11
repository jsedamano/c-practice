	.file	"exercise5.c"
	.text
	.globl	what
	.type	what, @function
what:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)		; first int parameter: x
	movl	%esi, -8(%rbp)		; second int parameter: y
	movl	%edx, -12(%rbp)		; third int parameter: z
	movl	-4(%rbp), %edx		; %edx = x
	movl	-8(%rbp), %eax		; %eax = y
	addl	%eax, %edx			; %edx = x + y
	movl	-12(%rbp), %eax		; %eax = z
	addl	%eax, %eax			; %eax = z + z
	cmpl	%eax, %edx			; COMPARE %edx with %eax: (x + y) with (2 * z)
	jge	.L2						; JUMP TO L2 if (x + y) >= (2 * z)
	movl	-4(%rbp), %edx		; %edx = x
	movl	-8(%rbp), %eax		; %eax = y
	addl	%edx, %eax			; %eax = y + x
	addl	%eax, -12(%rbp)		; z = z + (y + x)
	jmp	.L3						; JUMP TO L3 (no condition/comparison)
.L2:
	movl	-4(%rbp), %eax		; %eax = x
	cmpl	-8(%rbp), %eax		; COMPARE %eax with y: x with y
	jge	.L4						; JUMP TO L4 if x >= y
	movl	-12(%rbp), %edx		; %edx = z
	movl	-8(%rbp), %eax		; %eax = y
	addl	%eax, %edx			; %edx = z + y
	movl	-4(%rbp), %eax		; %eax = x
	addl	%edx, %eax			; %eax = x + (z + y)
	movl	%eax, -12(%rbp)		; z = x + (z + y)
	jmp	.L3						; JUMP TO L3 (no condition/comparison)
.L4:
	movl	-4(%rbp), %edx		; %edx = x
	movl	-8(%rbp), %eax		; %eax = y
	addl	%edx, %eax			; %eax = y + x
	movl	%eax, -12(%rbp)		; z = y + x
.L3:
	movl	-12(%rbp), %eax		; %eax = z (final return)
	leave
	ret
	.size	what, .-what
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits