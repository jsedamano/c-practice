int function(int x, int y, int z) {
    if ((x + y) < (2 * z)) {    // jge	.L2
        z = x + y;              // movl	%eax, -12(%rbp)
    } else {                    // .L2
        z = x + (z + y);        // movl	%eax, -12(%rbp)
    }
    return z;                   // movl	-12(%rbp), %eax
}