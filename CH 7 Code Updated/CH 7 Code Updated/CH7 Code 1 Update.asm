.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter a character: $'
    MSG2 DB 0DH,0AH,'Converted character: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    
    MOV AH, 01H
    INT 21H
    MOV BL, AL           

 
    TEST BL, 20H         ; Test bit 5
    JZ  UPPERCASE        ;If result = 0 ? ZF=1 ? bit 5 was 0 ? uppercase
    ; Else lowercase ? convert to uppercase
    AND BL, 0DFH         ; Clear bit 5
    JMP DISPLAY

UPPERCASE:
    ; If uppercase ? convert to lowercase
    OR BL, 20H           ; Set bit 5

DISPLAY:
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Print converted character
    MOV DL, BL
    MOV AH, 02H
    INT 21H

   
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
