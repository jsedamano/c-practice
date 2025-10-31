// ----------------------------------------------------------------
/**
 * Can run with "gcc -o executable main.c".
 * "gcc" is the compiler.
 * "-o name" for the name of the executable.
 * "main.c" the name of the c file to compile.
 * Then, run with "./executable".
 * 
 * Can also run with warnings: "gcc -o executable -Wall -Wextra main.c".
 */
#include <stdio.h> // Standard library "standard input/output"

int main() {
    // Print a simple string
    printf("Hello World!\n");
    printf("--------------------------------\n");

    // ----------------------------------------------------------------
    // Declaring simple variables
    int myNumber = 5;
    char myCharacter = 'A';
    double myDouble = 3.14;

    // Printing simple variables
    printf("This is my number: %d\n", myNumber); // %d for integer
    printf("This is my character: %c\n", myCharacter); // %c for character
    printf("This is my double: %f\n", myDouble); // %f for double
    printf("This is my double: %.2f\n", myDouble); // .2f limits decimal printing
    printf("--------------------------------\n");

    // Printing addresses of the variables
    // "&" is used for this --> Adress-of
    printf("This is the adress of my number: %p\n", &myNumber);
    printf("This is the adress of my character: %p\n", &myCharacter);
    printf("This is the adress of my double: %p\n", &myDouble);
    printf("--------------------------------\n");

    // ----------------------------------------------------------------
    // Pointers
    // p is a pointer that can store the address of an integer
    // In this case, p points to the int x.
    // "*" is used to retrieve the value at an address --> Value-of
    int x = 5;
    int *p = &x; // p is a pointer to the address of x

    printf("The value of X is: %d\n", x);
    printf("The adress of X is: %p\n", &x); // %p for address

    printf("The value of P is: %p\n", p); // The value of p is the address of x
    printf("The value stored in P is: %d\n", *p); // "*" to print the value stored in p
    printf("The adress of P is: %p\n", &p); // Different from the address of x
    printf("--------------------------------\n");

    // So we can see that p is something (a pointer) that stores the address of something else.
    // If we directly print its value (p), we will obtain the address of what it is pointing to.
    // If we want to print the value stored in the address that it is pointing to: *p.
    // If we want to print the actual address of p (different from the address of what it is pointing to): &p.
    // p is a different object/thing itself, so it has its own address.

    // ----------------------------------------------------------------
    // Pointer to a pointer
    // ptr2 is a pointer that can store the address of another pointer
    int y = 10;
    int *ptr1 = &y; // ptr1 is a pointer to the address of y
    int **ptr2 = &ptr1; // ptr2 is a pointer to the pointer ptr1

    printf("The value of Y is: %d\n", y);
    printf("The adress of Y is: %p\n", &y);

    printf("--------\n");
    printf("The value of ptr1 is: %p\n", ptr1);
    printf("The value stored in ptr1 is: %d\n", *ptr1);
    printf("The adress of ptr1 is: %p\n", &ptr1);

    printf("--------\n");
    printf("The value of ptr2 is: %p\n", ptr2); // Value of ptr2 = address of ptr1
    printf("The value stored in ptr2 is: %p\n", *ptr2); // Value stored in ptr2 = value of ptr1 = address of y
    printf("The value of what ptr2 points to is: %d\n", **ptr2); // = value stored in ptr1 = y
    printf("The adress of ptr2 is: %p\n", &ptr2);

    // So we can see that ptr2 is a pointer that points to ptr1, that points to the address of y.
    // The value of ptr2 is the address of ptr1.
    // The value stored in ptr2 is the value of ptr1, that is the address of y.
    // The value stored in what ptr2 points to is the value stored in ptr1, which is y.

    // ┌───────────────────┐
    // │         y         │ = 10
    // │ addr: 0x16f0fec54 │
    // └───────────────────┘
    //         ▲
    //         │ (&y)
    // ┌───────────────────┐
    // │       ptr1        │ = 0x16f0fec54 (→ y)
    // │ addr: 0x16f0fec48 │
    // └───────────────────┘
    //         ▲
    //         │ (&ptr1)
    // ┌───────────────────┐
    // │       ptr2        │ = 0x16f0fec48 (→ ptr1)
    // │ addr: 0x16f0fec40 │
    // └───────────────────┘

    return 0;
}