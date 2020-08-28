#include <stdlib.h>
#include <stdio.h>
#include <time.h>

unsigned int cnt_chr(char *str, char ch);

int main()
{
    srand(time(NULL));

    printf("cnt_chr(\"ABADEAG\", 'A') = %d.\n", cnt_chr("ABADEAG", 'A'));
    printf("cnt_chr(\"AAAAAAA\", 'B') = %d.\n", cnt_chr("AAAAAAA", 'B'));
    printf("cnt_chr(\"BBBBCCC\", 'C') = %d.\n", cnt_chr("BBBBCCC", 'C'));
    printf("cnt_chr(\"dDdDDdd\", 'D') = %d.\n", cnt_chr("dDdDDdd", 'D'));
    printf("cnt_chr(\"ABCDEFG\", 'E') = %d.\n", cnt_chr("ABCDEFG", 'E'));
    printf("cnt_chr(\"ABCDEFG\", 'F') = %d.\n", cnt_chr("ABCDEFG", 'F'));
    printf("cnt_chr(\"GGGGGGG\", 'G') = %d.\n", cnt_chr("GGGGGGG", 'G'));
    printf("cnt_chr(\"\", 'H') = %d.\n", cnt_chr("", 'H'));
    printf("cnt_chr(\"ABCDEFG\", 'I') = %d.\n", cnt_chr("ABCDEFG", 'I'));

    return 0;
}