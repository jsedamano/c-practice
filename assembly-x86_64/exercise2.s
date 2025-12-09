	.file	"part2.c"
	.text
	.globl	function
	.type	function, @function
function:
	pushq	%rbp                ; push the (old) base pointer into the stack
	movq	%rsp, %rbp          ; move the stack pointer to the base (%rbp = %rsp)
	subq	$24, %rsp           ; reserve 24 bytes for local variables (in the stack)
	movl	%edi, -20(%rbp)     ; store first int parameter into -20(%rbp), let's call it a
	movl	%esi, -24(%rbp)     ; store second int parameter into -24(%rbp), let's call it b
	movl	-20(%rbp), %eax     ; move/load a into %eax
	imull	-24(%rbp), %eax     ; multiply %eax with b: %eax = a * b
	movl	%eax, -4(%rbp)      ; store the result (currently in %eax), into -4(%rbp), let's call it x
	movl	-20(%rbp), %edx     ; move/load a into %edx
	movl	-24(%rbp), %eax     ; move/load b into %eax
	addl	%edx, %eax          ; add %edx to %eax: %eax = a + b
	movl	%eax, -8(%rbp)      ; store the result (currently in %eax) into -8(%rbp), let's callt it y
	movl	-8(%rbp), %eax      ; move/load y into %eax
	imull	-4(%rbp), %eax      ; multiply %eax with x: %eax = y * x
                                ; notice this is not stored nowhere, but in %eax, so it is just returned
	leave                       ; "mov %rbp, %rsp" | "pop %rbp"
	ret                         ; returns to the caller
	.size	function, .-function
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits