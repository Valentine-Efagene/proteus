;************************************************      
; ACTUALLY, THE WAIT FORMAT USED IN THE BOOK,
; Scott Mackenzie - The 8051 Microcontroller,
; IS THE CORRECT APPROACH, BUT IT DIDN'T WORK HERE,
; AND ON EDSIM51; SO, I ONLY HAD TO CHANGE IT 
; OUT OF NECESSITY. THIS IS BECAUSE AFTER 
; READING, BS SHOULD APPEAR AT DBUS.7,
; SO, THE METHOD OF SETTING DBUS.7, HENCE 
; ENSURING THAT WHEN IT BECOMES FREE 
; (BF=0), IT WOULD BE EASILY DETECTED, SHOULD 
; ACTUALLY BE THE CORRECT APPROACH
;************************************************

      ORG 0000H
      MOV 30H, #'H'
      MOV 31H, #'E'
      MOV 32H, #'L'
      MOV 33H, #'L'
      MOV 34H, #'O'
      MOV 35H, #' '
      MOV 36H, #'R'
      MOV 37H, #'O'
      MOV 38H, #'S'
      MOV 39H, #'E'
      ;MOV 3AH, #''
      ;MOV 3BH, #'C'
      ;MOV 3CH, #'C'
      ;MOV 3DH, #'C'
      ;MOV 3EH, #'C'
      ;MOV 3FH, #'C'
      ;MOV 40H, #'C'
      ;MOV 41H, #'C'
      ;MOV 42H, #'C'
      ;MOV 43H, #'C'
      ;MOV 44H, #'C'
      ;MOV 45H, #'C'
      ;MOV 46H, #'C'
      ;MOV 47H, #'C'
      ;MOV 48H, #'C'

      RS EQU P3.0
      RW EQU P3.1
      E EQU P3.2
      DBUS EQU P1
      PTR EQU R0
      MESSAGE_LENGTH EQU R1
      LJMP MAIN

      ORG 8000H
MAIN: ACALL INIT
      MOV MESSAGE_LENGTH, #10 ; THIS IS THE LENGTH OF THE MESSAGE
STRT: MOV PTR, #30H
NEXT: MOV A, @PTR
      ACALL DISP
      INC PTR
      DJNZ MESSAGE_LENGTH, NEXT
      SJMP FINISH
FINISH: JMP $

;**********************************
; Initialize the LCD
;**********************************
INIT: MOV A, #38H
      CLR RS
      CLR RW
      ACALL OUT
      ACALL WAIT

      MOV A, #0EH
      CLR RS
      ACALL OUT
      ACALL WAIT

;*********************************
; Display data on LCD
;*********************************
DISP: SETB RS
      ACALL OUT
      ACALL WAIT
      RET

;*********************************
; Wait for LCD to be free
;*********************************
WAIT: CLR RS
      SETB RW
      SETB E
      CLR E
      JB DBUS.7, WAIT
      RET

;********************************
; Output to LCD
;********************************
OUT:  MOV DBUS, A
      CLR RW
      SETB E
      CLR E
      RET
      
      END
