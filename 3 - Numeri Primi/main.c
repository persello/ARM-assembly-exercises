#include <stdlib.h>
#include <stdio.h>
#include <time.h>

unsigned int nprimes(unsigned int n);

int main()
{
    srand(time(NULL));

    unsigned int n = rand() % 100;
    unsigned int a = nprimes(n);

    printf("nprimes(%d) = %d.\n", n, a);

    return 0;
}