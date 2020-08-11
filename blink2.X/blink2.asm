#include "p10f200.inc"
; CONFIG
   __CONFIG _WDT_OFF & _CP_OFF & _MCLRE_OFF
   ORG 0x0000
INIT
   MOVLW  ~(1<<T0CS)      ;Enable GPIO2
   OPTION    
   MOVLW ~((1 << GP2) | (1 << GP1)) ;Set GP1 and GP2 as outputs
   TRIS GPIO
LOOP
   BCF GPIO, GP1          ;Reset GP1
   BSF GPIO, GP2          ;Set GP2

   CALL DELAY             ;Call DELAY subroutine
   BSF GPIO, GP1          ;Set GP1
   BCF GPIO, GP2          ;Reset GP2
   
   CALL DELAY             ;Call DELAY subroutine
   GOTO LOOP              ;loop forever
 
DELAY                     ;Start DELAY subroutine here
    MOVLW D'162'          ;Load initial value for the delay    
    MOVWF 10              ;Copy the value to the register 0x10
    MOVWF 11              ;Copy the value to the register 0x11
DELAY_LOOP                ;Start delay loop
    DECFSZ 10, F          ;Decrement the register 0x10 and check if not zero
    GOTO DELAY_LOOP       ;If not then go to the DELAY_LOOP label
    DECFSZ 11, F          ;Else decrement the register 0x11, check if it is not 0
    GOTO DELAY_LOOP       ;If not then go to the DELAY_LOOP label
    RETLW 0               ;Else return from the subroutine
 
    END


