#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

int minpos(int* v, unsigned int len);

int main()
{
    srand(time(NULL));

    int v[11] = {-5, 4, 6, -6, -5, 3, 2, 9, -1, 0, 3};
    printf("Result = %d.\n", minpos(v, 11));

    return 0;
}