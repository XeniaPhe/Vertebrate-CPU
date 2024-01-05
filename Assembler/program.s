.data
.code
MAIN
    cli
    ldi 7 0x0FFF

    ldi 0 0xFFFF
    ldi 1 0x0010
    call PROC_unsigned_div_and_mod
    push 0
    push 1
    
inf
    jmp inf
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

    mov 3 1
    mov 0 2
    call PROC_clz
    mov 4 0
    mov 0 3     
    call PROC_clz
    mov 1 2     
    sub 2 0 4
    mov 0 3
    shl 0 0 2

    ldi 3 0x0000
    ldi 4 0x0001

div_loop
    shl 3 3 4
    mov 5 0
    call PROC_unsigned_cmp
    dec 0
    jz div_loop_1
    sub 1 1 5
    inc 3
div_loop_1
    mov 0 5
    shr 0 0 4
    dec 2
    ldi 5 0x8000
    and 5 5 2
    jz div_loop

END_unsigned_div_and_mod
    mov 0 3
    pop 5
    pop 4
    pop 3
    pop 2
RET_unsigned_div_and_mod
ret