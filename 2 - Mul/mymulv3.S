.global mymulv3
.type mymulv3, %function

/*

unsigned int Mul(unsigned int a, unsigned int b) {
    unsigned int m;
    if(b == 0)
        return 0;
    else {
        m = Mul(a << 1, b >> 1);
        if(b & 1)
            m += a;
        return m;
    }
}

*/

// a -> r0 -> r4
// b -> r1 -> r5
// m -> r0

mymulv3:
        stmfd   sp!, {r4, r5, r6, lr}

        mov     r4, r0
        subs    r5, r1, #0
        moveq   r0, r1
        beq     return
        mov     r0, r0, LSL #1
        mov     r1, r1, LSR #1
        bl      mymulv3
        tst     r5, #1
        addne   r0, r0, r4

return:
        ldmfd   sp!, {r4, r5, r6, pc}
