int curious(int x) {
    int a = 0;
    int b = 10;
    do {
        if ((2 * x) <= 9) {
            a = a + 1;
        } else {
            x = x - 4;
        }
        b = b - 1;
    } while (b > 0);
    return x;
}