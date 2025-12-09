int what(int x, int y, int z) {
    if (x + y < 2 * z) {
        z += x + y;
    } else if (x < y) {
        z = x + (z + y);
    } else {
        z = x + y;
    }
    return z;
}