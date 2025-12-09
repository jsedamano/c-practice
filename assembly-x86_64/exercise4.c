int function(int x) {
    int y = 0;          // movl	$0, -4(%rbp)
    int z = 0;          // movl	$0, -8(%rbp)
    while (z <= x) {    // cmpl	-20(%rbp), %eax
        z = z + 2;      // addl	$2, -8(%rbp)
        y = y + z;      // addl	%eax, -4(%rbp)
    }
    return y;           // movl	-4(%rbp), %eax
}