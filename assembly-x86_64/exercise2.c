int function(int a, int b) {
    int x = a * b;      // movl	%esi, -24(%rbp)
    int y = a + b;      // movl	%eax, -4(%rbp)
    return y * x;       // imull -4(%rbp), %eax
}