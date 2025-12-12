time_convert:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $8, %rsp
    movl    %edi, -4(%rbp)      ; first int parameter: x
    cmpl    $12, -4(%rbp)       ; COMPARE x with 12
    jle     .L2                 ; JUMP TO L2 if x <= 12
    movl    -4(%rbp), %eax      ; %eax = x
    subl    $12, %eax           ; %eax = x - 12 (final return)
    jmp     .L3                 ; JUMP TO L3 (no condition/comparison)
.L2:
    cmpl    $0, -4(%rbp)        ; COMPARE x with 0
    jne     .L4                 ; JUMP TO L4 if x != 0
    movl    $12, %eax           ; %eax = 12 (final return)
    jmp     .L3                 ; JUMP TO L3 (no condition/comparison)
.L4:
    movl    -4(%rbp), %eax      ; %eax = x (final return)
.L3:
    leave
    ret