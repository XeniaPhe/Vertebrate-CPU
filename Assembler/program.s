.data
    IDT: 0x07F0
    DSP: 0x07F8
    SWB: 0x07FE
    PB1: 0x0800
    PB2: 0x0802
    data_displayed: 0xFFFF
    timer: .space 1
    operation: .space 1
    prev_number: .space 1
    curr_exists: .space 1
.code
MAIN
    cli
    ldi 7 0x0FFF
    ldi 0 IDT
    ld 0 0
    ldi 1 ISR_timer
    st 0 1

    ldi 0 0x0000

    ldi 1 timer
    st 1 0
    ldi 1 operation
    st 1 0
    ldi 1 prev_number
    st 1 0
    ldi 1 curr_exists
    st 1 0
    sti

    ldi 2 PB1
    ld 2 2
    inc 2
    ldi 3 PB2
    ld 3 3
    ldi 4 0x0000
    ldi 5 0x0000

main_loop
    ld 0 3
    mov 0 0
    jz try_display_timer

try_display_result
    mov 0 5
    jmp try_display

try_display_timer
    ldi 0 timer
    ld 0 0

try_display
    ldi 1 data_displayed
    ld 1 1
    sub 1 1 0
    jz poll_PB1
    call PROC_display

poll_PB1
    ld 0 2
    mov 0 0
    jz main_loop
    ldi 0 0x0000
    st 2 0
    mov 0 2
    dec 0
    ld 0 0
    mov 0 0
    jz main_loop

check_SWB
    ldi 1 SWB
    ld 1 1
    ld 1 1
    ldi 0 0x000A
    sub 6 1 0
    jz main_loop
    inc 0
    sub 6 1 0
    jz main_loop
    inc 0
    sub 6 1 0
    jz equals
    inc 0
    sub 6 1 0
    jz operator
    inc 0
    sub 6 1 0
    jz operator
    inc 0
    sub 6 1 0
    jz operator

digit
    ldi 6 curr_exists
    ld 0 6
    mov 0 0
    jz first_digit
    mov 0 4
    call PROC_multiply_by_ten_and_accumulate
    mov 4 0
    mov 5 0
    jmp main_loop

first_digit
    mov 4 1
    mov 5 1
    inc 0
    st 6 0
    jmp main_loop

equals
    ldi 1 curr_exists
    ld 1 1
    mov 1 1
    jz number_equals_1
    ldi 6 operation
    ld 6 6
    mov 6 6
    jz number_equals_2
    mov 0 4
    ldi 1 prev_number
    ld 1 1
    push 6
    call PROC_calculate
    inc 7
    mov 5 0
    ldi 1 prev_number
    st 1 0
    ldi 4 0x0000
    ldi 1 operation
    st 1 4
    ldi 1 curr_exists
    st 1 4
    jmp main_loop

number_equals_1
    ldi 0 prev_number
    ld 5 0
    ldi 0 operation
    st 0 1
    jmp main_loop

number_equals_2
    ldi 0 prev_number
    st 0 4
    mov 4 6
    ldi 0 curr_exists
    st 0 6
    jmp main_loop

operator
    ldi 6 operation
    ld 0 6
    mov 0 0
    jz register_operator
    ldi 6 curr_exists
    ld 0 6
    mov 0 0
    jz change_operator

subcalculation
    ldi 6 operation
    ld 0 6
    push 0
    st 6 1
    mov 0 4
    ldi 1 prev_number
    ld 1 1
    call PROC_calculate
    inc 7
    mov 5 0
    ldi 1 prev_number
    st 1 0
    ldi 4 0x0000
    ldi 1 curr_exists
    st 1 4
    jmp main_loop

register_operator
    st 6 1
    ldi 1 prev_number
    st 1 4
    mov 4 0
    ldi 1 curr_exists
    st 1 0
    jmp main_loop

change_operator
    st 6 1
    jmp main_loop

END_PROGRAM
cli

PROC_calculate
    push 2
    push 3

    inc 7
    inc 7
    ld 2 7
    dec 7
    dec 7

    mov 2 2
    jz END_calculate
    ldi 3 0x000F
    sub 3 3 2
    jz addition
    dec 3
    sub 3 3 2
    jz subtraction
    
multiplication
    call PROC_multiply
    jmp END_calculate
subtraction
    sub 0 1 0
    jmp END_calculate
addition
    add 0 1 0
    jmp END_calculate

END_calculate
    pop 3
    pop 2
RET_calculate
ret

PROC_multiply
    push 2
    push 3
    push 4

    mov 2 0
    call PROC_unsigned_cmp
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

PROC_display
    push 2
    push 3
    push 4

    ldi 1 data_displayed
    st 1 0

    ldi 2 DSP
    ld 2 2
    ldi 3 0x0004
    
disp_loop
    ldi 1 0x000A
    call PROC_unsigned_div_and_mod

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

error
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
    push 0
    push 1
    sti

    ldi 0 0x07FD
    ld 0 0
    ldi 1 timer
    st 1 0

END_timer
    pop 1
    pop 0
RET_ISR_timer
iret