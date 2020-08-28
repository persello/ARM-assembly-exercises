.global nprimes
.type nprimes, %function

/*  
    +---- unsigned int nprimes(unsigned int n) -----+
    |  returns the number of prime numbers in [2,n] |
    |  if n < 2 the function returns zero           |
    +-----------------------------------------------+

    unsigned int nprimes(unsigned int n) {
        int found = 0;
        
        for(int i = 2; i <= n; i++) {
            if(isprime(i))
                found++;
        }

        return found;
    }

    n -> r0 -> r5
    found -> r4 -> r0 (return)

*/

nprimes:
        stmfd   sp!, {r4, r5, r6, lr}

        mov     r5, r0          // n
        mov     r4, #0          // found = 0
        
        cmp     r5, #1          // if n < 2 <=> n <=1
        bls     return          // ...return

for_loop:
        mov     r0, r5          // Prepare arg for call
        bl      isprime         // Call
        cmp     r0, #0          // If r0 (result) != 0
        addne   r4, #1          // found++

        sub     r5, #1          // n--

        cmp     r5, #1          // If !(n < 2)
        bhi     for_loop

return:
        mov     r0, r4          // return found
        ldmfd   sp!, {r4, r5, r6, pc}
