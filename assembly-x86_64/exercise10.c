int func(int x) {
    int a = 1;
    int b = 2;
    while (b <= x) {
        a = a * b;
        b = b + 1;
    }
    return a;
}