// ----------------------------------------------------------------
/**
 * Bitwise operators: manipulate data at the bit level.
 * They operate directly on the binary representation of integers.
 */
#include <stdio.h>

int main() {
    // Let's declare 2 integers
    int x = 6;      // 0000 0110
    int y = 12;     // 0000 1100

    // Variable for our result, initialize to 0
    int result = 0;
    
    // ------------------------------------------------
    /**
     * Bitwise AND (&): 1 just when there are two 1s.
     * 
     * 0000 0110    // 6
     * 0000 1100    // 12
     * 0000 0100    // 4
     */
    result = x & y;     // 6 & 12 = 4
    printf("AND = %d\n", result);

    // ------------------------------------------------
    /**
     * Bitwise OR (|): 0 just when there are two 0s.
     * 
     * 0000 0110    // 6
     * 0000 1100    // 12
     * 0000 1110    // 14
     */
    result = x | y;     // 6 | 12 = 14
    printf("OR = %d\n", result);

    // ------------------------------------------------
    /**
     * Bitwise XOR (^): 1 just when bits differ.
     * 
     * 0000 0110    // 6
     * 0000 1100    // 12
     * 0000 1010    // 10
     */
    result = x ^ y;     // 6 ^ 12 = 10
    printf("XOR = %d\n", result);

    // ------------------------------------------------
    /**
     * Bitwise Left Shift (<<): Shifts bits left, filling 
     * in zeros at the right (LSB).
     * 
     * Equivalent to multiplying by 2^n (if no overflow).
     * 
     * x << 2:
     *  - 6 (x) is 0000 0110
     *  - We shift everything to the left 2 times
     *  - We just put 2 more 0s at the right
     * 
     * 0000 0110    // Initial
     * 0000 1100    // 1st shift
     * 0001 1000    // 2nd shift
     * The result is then 24, the same as 6 * 2^2 = 24
     */
    result = x << 2;    // 6 << 2 = 24
    printf("Shift Left = %d\n", result);

    /**
     * Bitwise Right Shift (>>): Shifts bits to the right.
     * Rightmost bits discarded; leftmost bits filled with 
     * copies of the sign bit.
     * 
     * A right shift by N divides by 2^n if:
     *  - the number is unsigned
     *  - the number is signed and positive
     *  - the number is signed, negative, and a power of 2 
     * Negative values behave differently depending on 
     * power-of-two alignment.
     * 
     * x >> 2:
     *  - 6 (x) is 0000 0110
     *  - We shift everything to the right 2 times
     *  - As 6 is a positive number, we put two 0s at the left
     * 0000 0110    // Initial
     * 0000 0011    // 1st shift
     * 0000 0001    // 2nd shift
     * The result is then 1
     * It should have been 1.5 because 6 / 2^2 = 1.5
     * But the computer just trims the .5 and returns 1
     */
    result = x << 2;    // 6 >> 2 = 1
    printf("Shift Right = %d\n", result);
    
    return 0;
}