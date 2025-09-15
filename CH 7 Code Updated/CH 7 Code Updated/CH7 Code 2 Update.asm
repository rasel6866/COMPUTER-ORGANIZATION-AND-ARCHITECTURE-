.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter a digit (0–9): $'
    msg_even DB 0DH,0AH,'The number is EVEN$'
    msg_odd  DB 0DH,0AH,'The number is ODD$'

.CODE
MAIN PROC
    ; initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; prompt user
    MOV AH, 9
    LEA DX, msg1
    INT 21H

    ; read one character
    MOV AH, 1
    INT 21H
    MOV BL, AL       ; keep input in BL

    ; check bit 0 (odd/even) using TEST
    TEST BL, 01H     ; AND BL with 00000001b
    JZ EVEN          ; if result=0 ? ZF=1 ? even

ODD:
    MOV AH, 9
    LEA DX, msg_odd
    INT 21H
    JMP EXIT

EVEN:
    MOV AH, 9
    LEA DX, msg_even
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN






