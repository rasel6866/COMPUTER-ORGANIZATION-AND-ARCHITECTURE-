.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter 3 lowercase characters: $'
    MSG2 DB 0DH,0AH,'Converted characters: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    
    MOV CX, 3        
    LEA SI, BUFFER   

INPUT_LOOP:
    MOV AH, 01H     
    INT 21H
    MOV BL, AL       ; store in BL

    
    AND BL, 0DFH    

    MOV [SI], BL     
    INC SI

    LOOP INPUT_LOOP

   
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    
    LEA SI, BUFFER
    MOV CX, 3

PRINT_LOOP:
    MOV DL, [SI]
    MOV AH, 02H
    INT 21H
    INC SI
    LOOP PRINT_LOOP

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

BUFFER DB 3 DUP(?)

END MAIN
