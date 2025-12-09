	.file	"part3.c"
	.text
	.globl	function
	.type	function, @function
function:
	pushq	%rbp                ; push the (old) base pointer into the stack
	movq	%rsp, %rbp          ; move the stack pointer to the base (%rbp = %rsp)
	subq	$16, %rsp           ; reserve 16 bytes for local variables (in the stack)
	movl	%edi, -4(%rbp)      ; store first int parameter into -4(%rbp), let's call it x
	movl	%esi, -8(%rbp)      ; store second int parameter into -8(%rbp), let's call it y
	movl	%edx, -12(%rbp)     ; store third int parameter into -12(%rbp), let's call it z
	movl	-4(%rbp), %edx      ; move/load x into %edx
	movl	-8(%rbp), %eax      ; move/load y into %eax
	addl	%eax, %edx          ; add %eax to %edx: %edx = x + y
	movl	-12(%rbp), %eax     ; move/load z into %eax
	addl	%eax, %eax          ; add %eax to %eax: %eax = z + z (or 2 * z)
	cmpl	%eax, %edx          ; compare %edx with %eax (x + y and 2 * z)
	jge	.L2                     ; jump to L2 (second block) if %edx >= %eax: (x + y) >= 2*z
                                ; -------- first block: condition was false --------
	movl	-4(%rbp), %edx      ; move/load x into %edx
	movl	-8(%rbp), %eax      ; move/load y into %eax
	addl	%edx, %eax          ; add %edx to %eax: %eax = x + y
	movl	%eax, -12(%rbp)     ; store the result (currently in %eax) into z
	jmp	.L3                     ; jump to L3 (withouth condition), to avoid the second block
.L2:                            ; -------- second block: condition was true --------
	movl	-12(%rbp), %edx     ; move/load z into %edx
	movl	-8(%rbp), %eax      ; move/load y into %eax
	addl	%eax, %edx          ; add %eax to %edx: %edx = z + y
	movl	-4(%rbp), %eax      ; move/load x into %eax
	addl	%edx, %eax          ; add %edx to %eax: %eax = x + (z + y)
	movl	%eax, -12(%rbp)     ; store the result (currently in %eax) into z
.L3:                            ; -------- final block: return instruction --------
	movl	-12(%rbp), %eax     ; move/load z into %eax, to finally return just z
	leave                       ; "mov %rbp, %rsp" | "pop %rbp"
	ret                         ; returns to the caller
	.size	function, .-function
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits