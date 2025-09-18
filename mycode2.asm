.MODEL SMALL
.STACK 100H
.DATA
msg_enter DB "Enter a character: $"
msg_notnum DB 0DH,0AH, "Not a number! $"
msg_even  DB 0DH,0AH, "The number is EVEN. $"
msg_odd   DB 0DH,0AH, "The number is ODD. $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; enter input
    MOV AH, 09H
    LEA DX, msg_enter
    INT 21H

   
    MOV AH, 1
    INT 21H
    MOV BL, AL      

   
    CMP BL, '0'
    JB NOT_NUMBER    
    CMP BL, '9'
    JA NOT_NUMBER    

   
    SUB BL, '0'      

   
    MOV AL, BL
    AND AL, 1        
    JZ IS_EVEN       

 
IS_ODD:
    MOV AH, 09H
    LEA DX, msg_odd
    INT 21H
    JMP EXIT

IS_EVEN:
    MOV AH, 09H
    LEA DX, msg_even
    INT 21H
    JMP EXIT

NOT_NUMBER:
    MOV AH, 09H
    LEA DX, msg_notnum
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN