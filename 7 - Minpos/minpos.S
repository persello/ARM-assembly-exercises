.global minpos
.type minpos, %function
.syntax unified

/*  
    +---- int minpos(int* v, unsigned int len) ------+
    |  Returns the minimum positive element of v.    |
    | Returns -1 if the array has no positive items. |
    +------------------------------------------------+

    int minpos(int* v, unsigned int len) {
        unsigned int offset;
        int min = -1;
        int item;

        // Find a positive item
        for(offset = 0; offset < len; offset++) {
            item = v[offset];
            if (item > 0) {
                min = item;
                offset++;
                break;
            }
        }
        
        // Find minimum
        for( ; offset < len; offset++)
            item = v[offset];
            if(item > 0 && item < min) 
                min = item;
        

        return min;
    }

    v -> r0 -> r2
    len -> r1
    offset -> r3
    item -> r4
    min -> r0

*/

minpos:
        stmfd   sp!, {r4, lr}
        
        mov     r2, r0                  // v: r0 -> r2
        mov     r0, #-1                 // min = -1

        mov     r3, #0                  // offset = 0

loop_pos:
        cmp     r1, r3                  // if (len <= offset)
        bls     loop_min                //     continue to next for
        ldr     r4, [r2, r3, LSL #2]    // item = *(v + offset * 4 (32 bit))
        cmp     r4, #0                  // if (item > 0)
        movgt   r0, r4                  //     min = item
        addgt   r3, #1                  //     offset++
        bgt     loop_min                //     go to next for
        add     r3, #1                  // offset++
        b       loop_pos                // cycle again

loop_min:
        cmp     r1, r3                  // if (len <= offset)
        ldmfdls sp!, {r4, pc}           //     return
        ldr     r4, [r2, r3, LSL #2]    // item = *(v + offset)
        cmp     r4, #0                  // if (item <= 0)
        ble     endif                   //     do not compare with min
        cmp     r4, r0                  // if (item < min)
        movlt   r0, r4                  //     min = item
endif:  
        add     r3, #1                  // offset++
        b       loop_min                // cycle again

