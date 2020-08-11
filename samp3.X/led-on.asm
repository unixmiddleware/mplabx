list p=10F200
#include <pic10f200.inc>
;CONFIG
    __CONFIG _WDT_OFF & _CP_OFF & _MCLRE_OFF
    ORG 0x0000
INIT                  ; We are initialising the microcontroller over the next 3 lines
    MOVLW ~(1 << GP1) ; These two lines get GP1 as an output ; MOVe Literal to Word
    TRIS GPIO         ; Tri State ; moves what's in W into GPIO
    BSF GPIO, GP1     ; Bit Set F ... sets GP1 output high to light the LED
LOOP
    GOTO LOOP         ; Do nothing other than keep running
    END;