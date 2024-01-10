.data
    IDT: 0x07F0
    PB1: 0x07F8
    PB2: 0x07FA
    SWB: 0x07FC
    DSP: 0x07FE
    data_displayed: 0xFFFF
    timer: .space 1
    lol: .space 16
    operation: .space 1
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

    ldi 2 0x0000
    ldi 3 0x0000
    ldi 4 0x0000
    ldi 5 0x0000

main_loop
    ldi 0 PB2
    ld 0 0
    ld 0 0
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
    st 1 0
    call PROC_display

poll_PB1
    ldi 0 PB1
    ld 0 0
    ld 1 0
    mov 1 1
    jz main_loop
    inc 0
    ld 1 0
    mov 1 1
    jz main_loop
    ldi 1 0x0000
    st 0 1

check_SWB
    ldi 0 SWB
    ld 0 0
    ld 0 0
    ldi 1 0x000F
    sub 1 1 0
    jz operator
    dec 1
    jz operator
    dec 1
    jz operator
    dec 1
    jz equals
    dec 1
    jz main_loop
    dec 1
    jz main_loop

digit
    mov 4 4
    jz first_digit
    ldi 1 0x0003
    shl 1 2 1
    ldi 6 0x0001
    shl 6 2 6
    add 2 6 1
    add 2 2 0
    mov 5 2
    jmp main_loop

first_digit
    mov 2 0
    mov 5 0
    ldi 4 0x0001
    jmp main_loop

equals
    mov 4 4
    jz number_equals_1
    ldi 6 operation
    ld 6 6
    mov 6 6
    jz number_equals_2
    mov 0 3
    mov 1 2
    call PROC_calculate
    mov 3 0
    mov 5 0
    ldi 2 0x0000
    ldi 4 0x0000
    st 6 4
    jmp main_loop

number_equals_1
    mov 5 3
    ldi 1 operation
    st 1 4
    jmp main_loop

number_equals_2
    mov 3 2
    ldi 2 0x0000
    ldi 4 0x0000
    jmp main_loop

operator
    ldi 6 operation
    ld 1 6
    mov 1 1
    jz register_operator
    mov 4 4
    jz change_operator

subcalculation
    mov 6 0
    mov 0 3
    mov 1 2
    call PROC_calculate
    mov 3 0
    mov 5 0
    ldi 1 operation
    st 1 6
    ldi 2 0x0000
    ldi 4 0x0000
    jmp main_loop

register_operator
    st 6 0
    mov 3 2
    ldi 2 0x0000
    ldi 4 0x0000
    jmp main_loop

change_operator
    st 6 0
    jmp main_loop

END_PROGRAM
cli

PROC_calculate
    push 2
    push 3

    ldi 2 operation
    ld 2 2

    ldi 3 0x000F
    sub 3 3 2
    jz addition
    dec 3
    jz subtraction
    dec 3
    jz multiplication
    jmp END_calculate
    
multiplication
    call PROC_multiply
    jmp END_calculate
subtraction
    sub 0 0 1
    jmp END_calculate
addition
    add 0 0 1
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
    inc 0
    sub 1 1 3
    and 6 1 5
    jz div_loop_1
    dec 0
    add 1 1 3
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

PROC_double_dabble
    push 2
    push 3
    push 4
    push 5
    push 6

    mov 1 0
    ldi 0 0x0000
    clz 2 1
    ldi 3 0x0010
    sub 2 3 2
    ldi 3 0x0000

    jmp shift_bcd

dd_loop
    sub 4 2 3
    jz END_double_dabble

check_bcd_3
    ldi 4 0x000F
    and 5 4 0
    ldi 4 0x0004
    sub 6 4 5
    ldi 4 0x8000
    and 4 4 6
    jz check_bcd_2
    ldi 4 0x0003
    add 0 0 4

check_bcd_2
    ldi 4 0x00F0
    and 5 4 0
    ldi 4 0x0040
    sub 6 4 5
    ldi 4 0x8000
    and 4 4 6
    jz check_bcd_1
    ldi 4 0x0030
    add 0 0 4

check_bcd_1
    ldi 4 0x0F00
    and 5 4 0
    ldi 4 0x0400
    sub 6 4 5
    ldi 4 0x8000
    and 4 4 6
    jz check_bcd_0
    ldi 4 0x0300
    add 0 0 4

check_bcd_0
    ldi 4 0xF000
    and 5 4 0
    ldi 4 0x4000
    sub 6 4 5
    ldi 4 0x8000
    and 4 4 6
    jz shift_bcd
    ldi 4 0x3000
    add 0 0 4

shift_bcd
    ldi 4 0x0001
    shl 0 0 4
    sub 5 2 3
    dec 5
    inc 3
    shr 5 1 5
    and 5 5 4
    or 0 0 5
    jmp dd_loop

END_double_dabble
    pop 6
    pop 5
    pop 4
    pop 3
    pop 2
RET_double_dabble
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

ISR_timer
    push 0
    push 1
    sti

    ldi 0 0x0800
    ld 0 0
    ldi 1 timer
    st 1 0

END_timer
    pop 1
    pop 0
RET_ISR_timer
iret