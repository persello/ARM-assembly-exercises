.global mymulv2
.type mymulv2, %function

/*

unsigned int Mul(unsigned int a, unsigned int b) {
    if(b == 0) return 0;
    else return a + Mul(a, b-1);
}

*/

// a -> r0 -> r4
// b -> r1 (not saved)
mymulv2:
        stmfd   sp!, {r4, lr}

        mov     r4, r0
        cmp     r1, #0

        movle   r0, #0
        ldmlefd sp!, {r4, pc}

        sub     r1, #1
        bl      mymulv2
        add     r0, r0, r4
        ldmfd   sp!, {r4, pc}
