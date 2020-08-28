.global cnt_chr
.type cnt_chr, %function

/*  
    +---- unsigned int cnt_chr(char *str, char ch) -----+
    |  Returns the number of occurrences of ch in str.  |
    +---------------------------------------------------+

    unsigned int cnt_chr(char *str, char ch) {
        char tmp;
        unsigned int cnt = 0;

        while(tmp = *(str++)) {
            if(tmp == ch) {
                cnt++;
        }

        return cnt;
    }

    str -> r0
    ch  -> r1
    tmp -> r2
    cnt -> r3 -> r0 (return)

*/

cnt_chr:
        mov     r3, #0          // cnt = 0
loop:   
        ldrb    r2, [r0], #1    // tmp = *(str++)
        cmp     r2, #0          // if tmp == 0
        beq     return          // return
        cmp     r2, r1          // if(tmp == ch)
        addeq   r3, #1          // cnt++
        b       loop


return:
        mov     r0, r3
        bx      lr
