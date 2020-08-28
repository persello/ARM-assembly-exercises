.global slen
.type slen, %function

/*  
    +---- unsigned int slen(const char *str, char ch) -----+
    |  Returns the length of str until the first           |
    |  occurrence of ch, if ch is not contained in str,    |
    |  it returns the length of the entire string (no \0). |
    +------------------------------------------------------+

    unsigned int slen(const char *str, char ch) {
        int len = 0;
        char cur;

        while(cur = *(str++)) {
            len++;
            if(cur == ch)
                break;
            cur = *(str++);
        }
        
        return len
    }

    str -> r0
    ch  -> r1
    len -> r2 -> r0 (return)
    cur -> r3

*/

slen:
        mov     r2, #0          // len = 0

loop:   
        ldrb    r3, [r0], #1    // cur = *(str++)
        cmp     r3, #0          // if(cur != NUL)
        addne   r2, #1          // len++
        cmpne   r1, r3          // if(cur != ch)
        bne     loop            // continue loop, otherwise exit

return:
        mov     r0, r2
        bx      lr
