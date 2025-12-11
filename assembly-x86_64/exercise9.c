int main() {
    int x = 7;
    int y = 12;
    int z = max(x, y);
    return 0;
}

int max(int a, int b) {
    int biggest = a;
    if (a < b) {
        biggest = b;
    }
    return biggest;
}

// gcc -S -fno-asynchronous-unwind-tables -mno-red-zone -O0 exercise9.c