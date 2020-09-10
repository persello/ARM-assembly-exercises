.global oddsum
.type oddsum, %function
.syntax unified

/*  
    +---- int oddsum(unsigned int vec[], unsigned int len) ------+

    vec -> r0 (entry) -> r4
    len -> r1 (entry)
    current -> r2
    index -> r3
    retval -> r0  (exit)

*/

oddsum:
        stmfd   sp!, {r4, lr}       @ Stack
        mov     r4, r0              @ Sposto vec da r0 a r4
        mov     r3, #0              @ index = 0
        mov     r0, #4              @ Preparazione mul r1, #4
        mul     r1, r0              @ Moltiplico la lunghezza per 4
        mov     r0, #0              @ Inizializzo il valore di ritorno a zero
loop:   
        cmp     r1, r3              @ Comparo len e index
        ldmfdls sp!, {r4, pc}       @ Se sono in fondo all'array esco dalla funzione
        ldr     r2, [r4, r3]        @ Altrimenti carico il valore successivo r2 = *(r4 + r3)
        tst     r2, #1              @ Controllo il bit LSB del valore caricato
        addne   r0, r2              @ Se è dispari lo aggiungo a r0 (retval)
        add     r3, #4              @ Incremento l'indice di 4 (int)
        b       loop                @ Torno al loop
