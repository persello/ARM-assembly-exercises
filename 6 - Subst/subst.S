.global subst
.type subst, %function
.syntax unified

/*  
    +---- unsigned int subst(char *str, char from, char to) -----+
    |  Replaces all the occurrences of from with to in str.      |
    |  Returns the number of substitutions.                      |
    +------------------------------------------------------------+

    unsigned int subst(char *str, char from, char to) {
        unsigned int cnt = 0;
        char tmp;
        
        while(tmp = *str) {
            if(tmp == from) {
                *str = to;
                cnt++;
            }
            str++;   
        }

        return cnt;
    }

    str -> r0 -> r4
    from -> r1
    to -> r2
    tmp -> r3
    cnt -> r0

*/

subst:
        stmfd   sp!, {r4, lr}

        mov     r4, r0              // str -> r4
        mov     r0, #0              // cnt <- 0

loop:   
        ldrb    r3, [r4]            // tmp = *str
        cmp     r3, #0              // if (tmp == 0)
        ldmfdeq sp!, {r4, pc}       // return cnt
        cmp     r3, r1              // if (tmp == from)
        strbeq  r2, [r4]            //     *str = to
        addeq   r0, #1              //     cnt++
        add     r4, #1              // str++
        b       loop


