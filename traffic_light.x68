*-----------------------------------------------------------
* Title      : Traffic Light
* Written by : Muhammad Aqil Bin Mohd Yusri (22302908)
* Date       : 22/05/2025
* Description: Traffic light with counter
*-----------------------------------------------------------

LEDS EQU $E00010
SEG8 EQU $E00000
SEG7 EQU $E00002
SEG6 EQU $E00004
SEG5 EQU $E00006
SEG4 EQU $E00008
SEG3 EQU $E0000A
SEG2 EQU $E0000C
SEG1 EQU $E0000E
    ORG    $1000
START:                  ; first instruction of program
    MOVE.B #$00, SEG1
    MOVE.B #$00, SEG2
    MOVE.B #$00, SEG3
    MOVE.B #$00, SEG4
    MOVE.B #$00, SEG5
    MOVE.B #$00, SEG6
    MOVE.B #$00, SEG7
    MOVE.B #$00, SEG8
    
LOOP:
    MOVE.B #$01, LEDS 
    BSR DELAY_9S
    CLR.B LEDS
    MOVE.B #$02, LEDS
    BSR DELAY_1S
    CLR.B LEDS
    MOVE.B #$04, LEDS
    BSR DELAY_9S
    CLR.B LEDS
    BRA LOOP
    
    
    SIMHALT             ; halt simulator

DELAY_9S:
    MOVE.L #$D7DB6, D5
    MOVE.B #$6F, SEG1
DEL1:
    CMP.L #$C2457, D5
    BEQ DISPLAY_8
    SUBQ.L #1, D5
    BNE DEL1
DEL2:
    CMP.L #$ACAF8, D5
    BEQ DISPLAY_7    
    SUBQ.L #1, D5
    BNE DEL2
DEL3:
    CMP.L #$97199, D5
    BEQ DISPLAY_6
    SUBQ.L #1, D5
    BNE DEL3
DEL4:
    CMP.L #$8183A, D5
    BEQ DISPLAY_5
    SUBQ.L #1, D5
    BNE DEL4
DEL5:
    CMP.L #$6BEDB, D5
    BEQ DISPLAY_4
    SUBQ.L #1, D5
    BNE DEL5
DEL6:
    CMP.L #$5657C, D5
    BEQ DISPLAY_3
    SUBQ.L #1, D5
    BNE DEL6
DEL7:
    CMP.L #$40C1D, D5
    BEQ DISPLAY_2
    SUBQ.L #1, D5
    BNE DEL7
DEL8:
    CMP.L #$2B2BE, D5
    BEQ DISPLAY_1
    SUBQ.L #1, D5
    BNE DEL8
DEL9:
    CMP.L #$1595F, D5
    BEQ DISPLAY_0
    SUBQ.L #1, D5
    BNE DEL9

DELAY_1S:
    MOVE.L #$1595F, D5
DEL_1:
    SUBQ.L #1, D5
    BNE DEL_1
    RTS

DISPLAY_8:   
    MOVE.B #$7F, SEG1
    BRA DEL2
DISPLAY_7:     
    MOVE.B #$07, SEG1
    BRA DEL3
DISPLAY_6:
    MOVE.B #$7D, SEG1
    BRA DEL4
DISPLAY_5:
    MOVE.B #$6D, SEG1
    BRA DEL5
DISPLAY_4:
    MOVE.B #$66, SEG1
    BRA DEL6
DISPLAY_3:
    MOVE.B #$4F, SEG1
    BRA DEL7
DISPLAY_2:
    MOVE.B #$5B, SEG1
    BRA DEL8
DISPLAY_1:
    MOVE.B #$06, SEG1
    BRA DEL9
DISPLAY_0:
    MOVE.B #$3F, SEG1
    RTS
    
    END    START        ; last line of source


