*-----------------------------------------------------------
* Title      : Traffic Light
* Written by : Muhammad Aqil Bin Mohd Yusri (22302908)
* Date       : 22/05/2025
* Description: Traffic light with counter
*-----------------------------------------------------------

LEDS EQU $E00010 ;define memory address for LED control
SEG8 EQU $E00000 ;define memory address for display 8
SEG7 EQU $E00002 ;define memory address for display 7
SEG6 EQU $E00004 ;define memory address for display 6
SEG5 EQU $E00006 ;define memory address for display 5
SEG4 EQU $E00008 ;define memory address for display 4
SEG3 EQU $E0000A ;define memory address for display 3
SEG2 EQU $E0000C ;define memory address for display 2
SEG1 EQU $E0000E ;define memory address for display 1
    ORG    $1000 ;set origin of the program to address $1000
START:                  ; first instruction of program
    MOVE.B #$00, SEG1 ;initialize display 1 to 0
    MOVE.B #$00, SEG2 ;initialize display 2 to 0
    MOVE.B #$00, SEG3 ;initialize display 3 to 0
    MOVE.B #$00, SEG4 ;initialize display 4 to 0
    MOVE.B #$00, SEG5 ;initialize display 5 to 0
    MOVE.B #$00, SEG6 ;initialize display 6 to 0
    MOVE.B #$00, SEG7 ;initialize display 7 to 0
    MOVE.B #$00, SEG8 ;initialize display 8 to 0
    
LOOP: 			;label for the main loop
    MOVE.B #$01, LEDS 	;turn on the first led
    BSR DELAY_9S 	;call the delay subroutine for 9 seconds 
    CLR.B LEDS 		;turn off the led
    MOVE.B #$02, LEDS 	;turn on the second led
    BSR DELAY_1S 	;call the delay subroutine for 1 second
    CLR.B LEDS 		;turn off the led
    MOVE.B #$04, LEDS 	;turn on the third led
    BSR DELAY_9S 	;call the delay subroutine for 9 seconds
    CLR.B LEDS 		;turn off the led
    BRA LOOP 		;branch back to the start of the loop
    
    
    SIMHALT             ; halt simulator

DELAY_9S:		;label for 9 seconds delay subroutine
    MOVE.L #$D7DB6, D5	;load hex number D7DB6 to register D5
    MOVE.B #$6F, SEG1	;set first display to display 9
DEL1:			;label for the first delay loop
    CMP.L #$C2457, D5	;compare D5 with C2457
    BEQ DISPLAY_8	;if equal branch to DISPLAY_8
    SUBQ.L #1, D5	;decrement D5
    BNE DEL1		;if not zero, repeat the loop
DEL2:			;label for the second delay loop
    CMP.L #$ACAF8, D5	;compare D5 with ACAF8
    BEQ DISPLAY_7    	;if equal, branch to DISPLAY_7
    SUBQ.L #1, D5	;decrement D5
    BNE DEL2		;if not zero, repeat the loop
DEL3:			;label for the third delay loop
    CMP.L #$97199, D5	;compare D5 with 97199
    BEQ DISPLAY_6	;if equal, branch to DISPLAY_6
    SUBQ.L #1, D5	;decrement D5
    BNE DEL3		;if not zero, repeat the loop
DEL4:			;label for the fourth delay loop
    CMP.L #$8183A, D5	;compare D5 with 8183A
    BEQ DISPLAY_5	;if equal branch to DISPLAY_5
    SUBQ.L #1, D5	;decrement D5
    BNE DEL4		;if not zero, repeat the loop
DEL5:			;label for the fifth delay loop
    CMP.L #$6BEDB, D5 	;compare D5 with 6BEDB
    BEQ DISPLAY_4	;if equal, branch to DISPLAY_4
    SUBQ.L #1, D5	;decrement D5
    BNE DEL5		;if not zero, repeat the loop
DEL6:			;label for the sixth delay loop
    CMP.L #$5657C, D5 	;compare D5 with 5657C
    BEQ DISPLAY_3	;if equal, branch to DISPLAY_3
    SUBQ.L #1, D5	;decrement D5
    BNE DEL6		;if not zero, repeat the loop
DEL7:			;label for the seventh delay loop
    CMP.L #$40C1D, D5	;compare D5 with 40C1D
    BEQ DISPLAY_2	;if equal, branch to DISPLAY_2
    SUBQ.L #1, D5	;decrement D5
    BNE DEL7		;if not zero, repeat the loop
DEL8:			;label for the eighth delay loop
    CMP.L #$2B2BE, D5	;compare D5 with 2B2BE
    BEQ DISPLAY_1	;if equal, branch to DISPLAY_1
    SUBQ.L #1, D5	;decrement D5
    BNE DEL8		;if not zero, repeat the loop
DEL9:			;label for the nineth delay loop
    CMP.L #$1595F, D5	;compare D5 with 1595F
    BEQ DISPLAY_0	;if equal branch to DISPLAY_0
    SUBQ.L #1, D5	;decrement D5
    BNE DEL9		;if not zero, repeat the loop

DELAY_1S:		;label for 1 second delay subroutine
    MOVE.L #$1595F, D5	;load hex number 1595F to D5
DEL_1:			;label for the 1 second delay loop
    SUBQ.L #1, D5	;decrement D5
    BNE DEL_1		;if not zero, repeat the loop
    RTS			;return from subroutine

DISPLAY_8:   		;label to display number 8
    MOVE.B #$7F, SEG1	;set first display to display 8
    BRA DEL2		;branch to DEL2
DISPLAY_7:     		;label to display number 7
    MOVE.B #$07, SEG1	;set first display to display7
    BRA DEL3		;branch to DEL3
DISPLAY_6:		;label to display number 6
    MOVE.B #$7D, SEG1	;set first display to display 6
    BRA DEL4		;branch to DEL4
DISPLAY_5:		;label to display number 5
    MOVE.B #$6D, SEG1	;set first display to display 5
    BRA DEL5		;branch to DEL5
DISPLAY_4:		;label to display number 4
    MOVE.B #$66, SEG1	;set first display to display 4
    BRA DEL6		;branch to DEL6
DISPLAY_3:		;label to display number 3
    MOVE.B #$4F, SEG1	;set first display to display 3
    BRA DEL7		;branch to DEL7
DISPLAY_2:		;label to display number 2
    MOVE.B #$5B, SEG1	;set first display to display 2
    BRA DEL8		;branch to DEL8
DISPLAY_1:		;label to display number 1
    MOVE.B #$06, SEG1	;set first display to display 1
    BRA DEL9		;branch to DEL9
DISPLAY_0:		;label to display 0
    MOVE.B #$3F, SEG1	;set first display to display 0
    RTS			;return from subroutine
    
    END    START        ; last line of source


