int time_convert(int x) {     // val given in 0-23 hours
    if (x > 12) {
        return (x - 12);
    }
    else if (x == 0) {
        return 12;
    }
    else {
        return x;
    }
}