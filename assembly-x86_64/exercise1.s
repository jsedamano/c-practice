	.file	"exercise1.c"
	.text
	.globl	function
	.type	function, @function
function:
	pushq	%rbp				; push the (old) base pointer into the stack
	movq	%rsp, %rbp			; move the stack pointer to the base (%rbp = %rsp)
	subq	$16, %rsp			; reserve 16 bytes for local variables (in the stack)
	movl	$4, -4(%rbp)		; store 4 into -4(%rbp), let's call it x
	movl	$5, -8(%rbp)		; store 5 into the -8(%rbp), let's call it y
	movl	-8(%rbp), %eax		; move/load y into %eax
	imull	-4(%rbp), %eax		; multiply %eax with x: %eax = y * x
	movl	%eax, -12(%rbp)		; store the result (currently in %eax) into -12(%rbp), let's call it z
	movl	-12(%rbp), %edx		; move/load z into %edx
	movl	-8(%rbp), %eax		; move/load y into %eax
	addl	%edx, %eax			; add %edx to %eax: %eax = z + y
	movl	%eax, -4(%rbp)		; store the result (currently in %eax) into x
	nop							; there is no final "movl something, %eax", so we asume return is void
	leave						; "mov %rbp, %rsp" | "pop %rbp"
	ret							; returns to the caller
	.size	function, .-function
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits