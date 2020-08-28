#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

unsigned int subst(char *str, char from, char to);

int main()
{
    srand(time(NULL));

    char* teststr = malloc(20);
    strcpy(teststr, "ABCBDBEB");
    subst(teststr, 'B', 'Q');
    printf("subst(\"ABCBDBEB\", 'B', 'Q') = %s.\n", teststr);

    return 0;
}