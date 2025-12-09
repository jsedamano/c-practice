void function(void) {
    int x = 4;          // movl	$4, -4(%rbp)
    int y = 5;          // movl	$5, -8(%rbp)
    int z = y * x;      // movl	%eax, -12(%rbp)
    x = z + y;          // movl	%eax, -4(%rbp)
}