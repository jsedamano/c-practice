int arith(int x, int y, int z) {
    int t1 = x + y;
    int t2 = z * 48;            // implemented via 3*z then left shift by 4
    int t3 = t1 & 0xFFFF;       // keep only low 16 bits
        // 0000 0000 0000 0000 1111 1111 1111 1111 == 0xFFFF
    int t4 = t2 * t3;
    return t4;
}

// gcc -S -fno-asynchronous-unwind-tables -mno-red-zone -O0 exercise8.c