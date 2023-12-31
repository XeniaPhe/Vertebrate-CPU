Caller Saved Registers : R0 and R1
Callee Saved Registers : R2-R6
Stack Pointer : R7

Argument Registers : R0 and R1
Extra arguments can be passed via stack?
Return Registers : R0 and R1

.data
    ISP : 0x0FFF
    IDT : 0x07F0

    DSP : 0x07F8
    SWB : 0x07FE
    PB1 : 0x800
    PB2 : 0x802
    
    timer : .space 1
    result : .space 1
    current_number : .space 1
    operation : .space 1

.code
MAIN
    cli

    ldi 0 IDT
    ld 0 0

    ldi 1 ISR_timer
    st 0 1

    ldi 7 ISP
    ld 7 7
    
    sti

    ldi 0 0x0000
    ldi 1 timer
    st 1 0
    ldi 1 result
    st 1 0
    ldi 1 operation
    st 1 0

main_loop
    
    jmp main_loop

RET_MAIN
cli

PROC_multiply
    push 2
    push 3
    push 4

    mov 2 0
    call PROC_compare
    ldi 3 0xFFFF
    sub 3 3 0
    jz switch
    jmp prep_mult_loop

switch
    mov 3 1
    mov 1 2
    mov 2 3

prep_mult_loop
    ldi 0 0x0000
    ldi 3 0x0000

mult_loop
    sub 4 1 3
    jz END_multiply
    add 0 0 2
    inc 3
    jmp mult_loop

END_multiply
    pop 4
    pop 3
    pop 2
RET_multiply
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
RET_multiply_by_ten_and_accumulate
ret

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

PROC_display
    push 2
    push 3
    push 4

    ldi 0 PB2
    ld 0 0
    mov 0 0
    jz disp_time
    ldi 0 result

disp_time
    ldi 0 timer

    ld 0 0
    ldi 2 DSP
    ld 2 2
    ldi 3 0x0004
    
disp_loop
    ldi 1 0x000A
    call PROC_division_and_modulo

    mov 4 0
    mov 0 1
    call PROC_map_to_seven_segment

    st 2 0
    mov 0 4

    inc 2
    dec 3
    jz END_display
    jmp disp_loop

END_display
    pop 4
    pop 3
    pop 2
RET_display
ret

PROC_map_to_seven_segment
    push 2

    ldi 1 0x0009
    sub 2 1 0
    jz nine
    dec 1
    sub 2 1 0
    jz eight
    dec 1
    sub 2 1 0
    jz seven
    dec 1
    sub 2 1 0
    jz six
    dec 1
    sub 2 1 0
    jz five
    dec 1
    sub 2 1 0
    jz four
    dec 1
    sub 2 1 0
    jz three
    dec 1
    sub 2 1 0
    jz two
    dec 1
    sub 2 1 0
    jz one
    dec 1
    sub 2 1 0
    jz zero

    ldi 0 0x004F
    jmp END_map_to_seven_segment

nine
    ldi 0 0x007B
    jmp END_map_to_seven_segment
eight
    ldi 0 0x007F
    jmp END_map_to_seven_segment
seven
    ldi 0 0x0070
    jmp END_map_to_seven_segment
six
    ldi 0 0x005F
    jmp END_map_to_seven_segment
five
    ldi 0 0x005B
    jmp END_map_to_seven_segment
four
    ldi 0 0x0033
    jmp END_map_to_seven_segment
three
    ldi 0 0x0079
    jmp END_map_to_seven_segment
two
    ldi 0 0x006D
    jmp END_map_to_seven_segment
one
    ldi 0 0x0030
    jmp END_map_to_seven_segment
zero
    ldi 0 0x007E

END_map_to_seven_segment
    pop 2
RET_map_to_seven_segment
ret

ISR_timer
    sti
    push 0
    push 1

    ldi 0 0x07FD
    ld 0 0

    ldi 1 timer
    st 1 0

    pop 1
    pop 0
RET_ISR_timer
iret