#include <stdlib.h>
#include <stdio.h>
#include <time.h>

unsigned int mymulv2(unsigned int a, unsigned int b);
unsigned int mymulv3(unsigned int a, unsigned int b);
void testv2();
void testv3();

int main()
{
    srand(time(NULL));

    for (int i = 0; i < 20; i++)
    {
        testv2();
    }

    for (int i = 0; i < 20; i++)
    {
        testv3();
    }

    printf("All tests passed.\n");

    return 0;
}

void testv2()
{
    unsigned int a = rand() % 100;
    unsigned int b = rand() % 100;

    printf("Testing mymulv2 with %d * %d. ", a, b);
    unsigned int res = mymulv2(a, b);
    unsigned int expected = a * b;

    if (res == expected)
        printf("Pass: %d.\n", res);
    else {
        printf("Fail: %d. Expected %d.\n", res, expected);
        exit(EXIT_FAILURE);
    }
}

void testv3()
{
    unsigned int a = rand() % 100;
    unsigned int b = rand() % 100;

    printf("Testing mymulv3 with %d * %d. ", a, b);
    unsigned int res = mymulv3(a, b);
    unsigned int expected = a * b;

    if (res == expected)
        printf("Pass: %d.\n", res);
    else {
        printf("Fail: %d. Expected %d.\n", res, expected);
        exit(EXIT_FAILURE);
    }
}