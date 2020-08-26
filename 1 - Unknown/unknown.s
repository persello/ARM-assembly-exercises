unknown1:
        ldrb    r2, [r0], #1        ; Load the byte from the address r0 in r2, increment r0
        ldrb    r3, [r1], #1        ; Load thest byte from the address r1 in r3, increment r1
        cmp     r2, #0              ; If
        beq     label_1             ; r2 == 0 execute label_1
        cmp     r2, r3              ; If    
        beq     unknown1            ; r2 = r3 call unknown
        mvnls   r0, #0
        movhi   r0, #1
        mov     pc, lr

label_1:
        mvn     r0, #0              ; Move ~0 in r0
        cmp     r3, #0              ; If
        moveq   r0, #0              ; r3 == 0, then r0 = 0
        mov     pc, lr              return r0


/*

strcmp

int unknown1(char *a, char *b) {
    x = *(a++);
    y = *(b++);

    if(x == 0) {
        retval = ~0 = -1;
        if (y == 0) retval = 0;
        return retval;
    }

    if(x == y) retval = unknown1(a, b);
    else if (x <= y) retval = ~0 = -1;
    else if (x > y) retval = 1

    retrun retval;
}

 */