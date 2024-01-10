.data
    IDT: 0x07F0
    PBL: 0x07F8
    DSP: 0x07FA
    result: 0x0001
.code

MAIN
    cli
    ldi 7 0x0FFF

    ldi 0 IDT
    ld 0 0
    ldi 1 ISR_btn_right
    st 0 1
    sti


    ldi 2 result
    ldi 3 PBL
    ldi 4 PBL
    ldi 5 0x0001
    inc 4

main_loop
    ld 0 2
    sub 6 5 0
    jz cont_loop
    mov 5 0
    call PROC_display
cont_loop
    ld 1 4
    mov 1 1
    jz main_loop
    ldi 6 0x0000
    st 4 6
    ld 1 3
    mov 1 1
    jz main_loop
    inc 0
    st 2 0
    jmp main_loop

END_PROGRAM
cli

PROC_unsigned_cmp
    push 2
    push 3
    push 4
    push 5

    sub 2 0 1
    jz equal

    ldi 3 0x8000
    and 4 3 0
    and 5 3 1
    sub 5 5 4
    jz leftmost_equal

    mov 4 4
    jz less

greater
    ldi 0 0x0001
    jmp END_unsigned_cmp
equal
    ldi 0 0x0000
    jmp END_unsigned_cmp
leftmost_equal
    ldi 0 0x0001
    and 4 2 3
    jz END_unsigned_cmp
less
    ldi 0 0xFFFF

END_unsigned_cmp
    pop 5
    pop 4
    pop 3
    pop 2
RET_unsigned_cmp
ret


PROC_unsigned_div_and_mod
    mov 1 1
    jz div_by_zero

    push 2
    mov 2 0
    call PROC_unsigned_cmp
    mov 0 0
    jz div_equal
    inc 0
    jz zero_quotient
    jmp div_loop_prep

div_by_zero
    ldi 0 0xFFFF
    ldi 1 0xFFFF
    jz RET_unsigned_div_and_mod

div_equal
    ldi 0 0x0001
    ldi 1 0x0000
    pop 2
    jmp RET_unsigned_div_and_mod

zero_quotient
    ldi 0 0x0000
    mov 1 2
    pop 2
    jmp RET_unsigned_div_and_mod

div_loop_prep
    push 3
    push 4
    push 5
    push 6

    clz 0 1
    clz 3 2
    sub 4 0 3
    shl 3 1 4
    mov 1 2

    ldi 0 0x0000
    ldi 2 0x0001
    ldi 5 0x8000
    
div_loop
    shl 0 0 2
    sub 6 3 1
    and 6 6 5
    jz div_loop_1
    inc 0
    sub 1 1 3
div_loop_1
    shr 3 3 2
    dec 4
    and 6 4 5
    jz div_loop

END_unsigned_div_and_mod
    pop 6
    pop 5
    pop 4
    pop 3
    pop 2
RET_unsigned_div_and_mod
ret

PROC_display
    push 2
    push 3

    ldi 1 0x000A
    call PROC_unsigned_div_and_mod
    mov 2 1

    ldi 1 0x000A
    call PROC_unsigned_div_and_mod
    ldi 3 0x0004
    shl 3 1 3
    or 2 2 3

    ldi 1 0x000A
    call PROC_unsigned_div_and_mod
    ldi 3 0x0008
    shl 3 1 3
    or 2 2 3

    ldi 1 0x000A
    call PROC_unsigned_div_and_mod
    ldi 3 0x000C
    shl 3 1 3
    or 2 2 3

    ldi 3 DSP
    ld 3 3
    st 3 2

END_display
    pop 3
    pop 2
RET_display
ret

ISR_btn_right
    push 0
    push 1
    sti

    ldi 1 result
    ld 0 1
    add 0 0 0
    st 1 0

    pop 1
    pop 0
RET_ISR_btn_right
iret