.data
.code
MAIN
    cli
    ldi 7 0x0FFF

    ldi 0 0x0001
    mov 1 0
    shl 1 1 0
    push 1
    shl 1 1 0
    push 1
    shl 1 1 0
    push 1
    shl 1 1 0
    push 1
    shl 1 1 0
    push 1
inf
    jmp inf

PROC_division_and_modulo
    push 2
    push 3
    push 4
    push 5

    mov 2 1
    mov 1 0

    ldi 3 0x0000
    ldi 4 0x000F
    ldi 5 0x0001
    
div_loop
    shl 0 2 4
    call PROC_compare
    sub 0 5 0
    jz div_check

    shl 0 2 4
    sub 1 1 0

    shl 0 5 4
    or 3 3 0
div_check
    dec 4
    jz END_division_and_modulo
    mov 1 1
    jz END_division_and_modulo
    jmp div_loop

END_division_and_modulo
    mov 0 3
    pop 5
    pop 4
    pop 3
    pop 2
RET_division_and_modulo
ret

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