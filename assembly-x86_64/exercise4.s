	.file	"part4.c"
	.text
	.globl	function
	.type	function, @function
function:
	pushq	%rbp				; push the (old) base pointer into the stack
	movq	%rsp, %rbp			; move the stack pointer to the base (%rbp = %rsp)
	subq	$24, %rsp			; reserve 24 bytes for local variables (in the stack)
	movl	%edi, -20(%rbp)		; store first int parameter into -20(%rbp), let's call it x
	movl	$0, -4(%rbp)		; store 0 into -4(%rbp), let's call it y
	movl	$0, -8(%rbp)		; store 0 into -8(%rbp), let's call it z
	jmp	.L2						; jump to L2
.L3:							; -------- while loop body --------
	addl	$2, -8(%rbp)		; add 2 to z: z = z + 2
	movl	-8(%rbp), %eax		; store z into %eax
	addl	%eax, -4(%rbp)		; add %eax to y: y = y + z
.L2:							; -------- comparison --------
	movl	-8(%rbp), %eax		; move/load z into %eax
	cmpl	-20(%rbp), %eax		; compare z with x
	jle	.L3						; jump to L3 if z <= x (CORE COMPARISON)
	movl	-4(%rbp), %eax		; if not, continue to move y to %eax to finally return that
	leave
	ret
	.size	function, .-function
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits