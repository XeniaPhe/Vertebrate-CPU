.data
.code
MAIN
    cli
    ldi 7 0x0FFF

inf
    jmp inf
END_PROGRAM
cli

PROC_compare
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
    jmp END_compare
equal
    ldi 0 0x0000
    jmp END_compare
leftmost_equal
    ldi 0 0x0001
    and 4 2 3
    jz END_compare
less
    ldi 0 0xFFFF

END_compare
    pop 5
    pop 4
    pop 3
    pop 2
RET_compare
ret

PROC_clz
    mov 0 0
    jz is_zero
    jmp continue_clz

is_zero
    ldi 0 0x0010
    jmp RET_clz

continue_clz
    push 2
    push 3

    ldi 1 0x000F
    ldi 2 0x0001
    jmp clz_body

clz_loop
    dec 1
    jz END_clz
clz_body
    shl 3 2 1
    and 3 3 0
    jz clz_loop

END_clz
    ldi 3 0x000F
    sub 0 3 1
    pop 3
    pop 2
RET_clz
ret

PROC_division_and_modulo
    mov 1 1
    jz RET_division_and_modulo

    push 2
    mov 2 0
    call PROC_compare
    jz div_equal
    inc 0
    jz zero_quotient
    jmp div_loop_prep

div_equal
    ldi 0 0x0001
    ldi 1 0x0000
    pop 2
    jmp RET_division_and_modulo

zero_quotient
    ldi 0 0x0000
    mov 1 2
    pop 2
    jmp RET_division_and_modulo

div_loop_prep
    push 3
    push 4
    push 5

    mov 3 1
    mov 0 2
    call PROC_clz
    mov 4 0
    mov 0 1
    call PROC_clz
    mov 1 3
    sub 3 0 4
    mov 0 2
    ldi 2 0x0000
    ldi 4 0x0001
    shl 1 1 3
    //u=0,v=1,q=2,k=3,one=4

div_loop
    shl 2 2 4
    mov 5 0
    call PROC_compare
    inc 0
    jz div_loop_1
    sub 5 5 1
    inc 2

div_loop_1
    mov 6 1
    mov 0 1
    call PROC_clz
    




END_division_and_modulo
    pop 5
    pop 4
    pop 3
RET_division_and_modulo
ret