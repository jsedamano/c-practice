func:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rdi, -8(%rbp)      ; first long parameter: a
    movq    %rsi, -16(%rbp)     ; second long parameter: b
    movq    -8(%rbp), %rax      ; %rax = a
    addq    -16(%rbp), %rax     ; %rax = a + b
    imulq   $3, %rax            ; %rax = (a + b) * 3
    addq    $7, %rax            ; %rax = (a + b) * 3 + 7
    leave
    ret