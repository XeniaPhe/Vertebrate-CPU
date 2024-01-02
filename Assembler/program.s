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