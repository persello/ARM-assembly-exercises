#include <stdlib.h>
#include <stdio.h>
#include <time.h>

unsigned int slen(const char *str, char ch);

int main()
{
    srand(time(NULL));

    printf("slen(\"ABCDEFG\", 'A') = %d.\n", slen("ABCDEFG", 'A'));
    printf("slen(\"ABCDEFG\", 'B') = %d.\n", slen("ABCDEFG", 'B'));
    printf("slen(\"ABCDEFG\", 'C') = %d.\n", slen("ABCDEFG", 'C'));
    printf("slen(\"ABCDEFG\", 'D') = %d.\n", slen("ABCDEFG", 'D'));
    printf("slen(\"ABCDEFG\", 'E') = %d.\n", slen("ABCDEFG", 'E'));
    printf("slen(\"ABCDEFG\", 'F') = %d.\n", slen("ABCDEFG", 'F'));
    printf("slen(\"ABCDEFG\", 'G') = %d.\n", slen("ABCDEFG", 'G'));
    printf("slen(\"ABCDEFG\", 'H') = %d.\n", slen("ABCDEFG", 'H'));
    printf("slen(\"ABCDEFG\", 'I') = %d.\n", slen("ABCDEFG", 'I'));

    return 0;
}