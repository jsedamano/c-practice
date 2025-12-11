func:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp
    movl    %edi, -20(%rbp)     ; first int parameter: x
    movl    $1, -4(%rbp)        ; a = 1
    movl    $2, -8(%rbp)        ; b = 2
    jmp     .L2                 ; JUMP TO L2 (no condition/comparison)
.L3:
    movl    -4(%rbp), %eax      ; %eax = a
    imull   -8(%rbp), %eax      ; %eax = a * b
    movl    %eax, -4(%rbp)      ; a = a * b
    addl    $1, -8(%rbp)        ; b = b + 1
.L2:
    movl    -8(%rbp), %eax      ; %eax = b
    cmpl    -20(%rbp), %eax     ; COMPARE %eax with x: b with x
    jle     .L3                 ; JUMP TO L3 if b <= x
    movl    -4(%rbp), %eax      ; %eax = a (final return)
    leave
    ret