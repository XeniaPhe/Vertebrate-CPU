Caller Saved Registers : R0 and R1
Callee Saved Registers : R2-R6
Stack Pointer : R7

Argument Registers In Order : R0 and R1
Return Register : R0

.data
    ISP : 0x0FFF
    IDT : 0x07F0

    DSP : 0x07F8
    SWB : 0x07FE
    PB1 : 0x800
    PB2 : 0x802
    
    timer : .space 1
    result : .space 1
.code
MAIN
    cli
    ldi 0 IDT
    ldi 1 ISR_timer
    ldi 7 ISP

    ld 0 0
    ld 7 7
    st 0 1
    sti

PROC_multiply
    push 2
    push 3
    push 4

    ldi 2 0x0000
    ldi 3 0x0000
    mult_loop
        sub 4 1 2
        jz end_mult
        add 3 3 0
        inc 2
        jmp mult_loop
    end_mult

    mov 0 3
    pop 4
    pop 3
    pop 2
END_multiply
    ret

PROC_multiply_by_ten_and_accumulate
    push 2
    push 3

    ldi 2 0x0003
    shl 3 0 2
    ldi 2 0x0001
    shl 2 0 2
    add 0 3 2
    add 0 0 1

    pop 3
    pop 2
END_multiply_by_ten_and_accumulate
    ret

ISR_timer
    sti
    push 0
    push 1

    ldi 0 0x07FD
    ldi 1 timer

    ld 0 0
    st 1 0

    pop 1
    pop 0
END_ISR_timer
    iret