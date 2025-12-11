main:
    pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
    movl    $7, -4(%rbp)        ; x = 7
    movl    $12, -8(%rbp)       ; y = 12
    movl    -8(%rbp), %edx      ; %edx = y
    movl    -4(%rbp), %eax      ; %eax = x
    movl    %edx, %esi          ; %esi = y
    movl    %eax, %edi          ; %edi = x
    call    max                 ; CALL TO FUNCTION "max"
    movl    %eax, -12(%rbp)     ; z = max(x, y)
    movl    $0, %eax            ; %eax = 0 (final return)
    leave
    ret

max:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp
    movl    %edi, -20(%rbp)     ; first int parameter: a
    movl    %esi, -24(%rbp)     ; second int parameter: b
    movl    -20(%rbp), %eax     ; %eax = a
    movl    %eax, -4(%rbp)      ; biggest = a
    movl    -20(%rbp), %eax     ; %eax = a
    cmpl    -24(%rbp), %eax     ; COMPARE %eax with b: a with b
    jge     .L4                 ; JUMP TO L4 if a >= b
    movl    -24(%rbp), %eax     ; %eax = b
    movl    %eax, -4(%rbp)      ; biggest = b
.L4:
    movl    -4(%rbp), %eax      ; %eax = biggest (final return)
    leave                       ; %rsp = %rbp
    ret                         ; popq %rbp