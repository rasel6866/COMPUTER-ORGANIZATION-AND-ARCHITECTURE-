
.MODEL SMALL             ; Use the small memory model (code and data segments each <= 64KB)
.STACK 100H              ; Allocate 256 bytes (100H) for the stack

.DATA                    ; Start of the data segment

    MSG1 DB 'Hello, World!', 13, 10, '$'         ; First message with newline (CR = 13, LF = 10)
    MSG2 DB 'Welcome to Assembly!', '$'          ; Second message without newline (already printed after line break)

.CODE                    ; Start of code segment

MAIN PROC                ; Define the main procedure (entry point)

    MOV AX, @DATA        ; Load the address of the data segment into AX
    MOV DS, AX           ; Initialize DS with AX so we can access data variables

    ; ----- Print first line -----
    MOV AH, 9            ; DOS function 9: Print string ending with '$'
    LEA DX, MSG1         ; Load effective address of MSG1 into DX
    INT 21H              ; Call DOS interrupt 21h to print the string

    ; ----- Print second line -----
    MOV AH, 9            ; Again set DOS function 9
    LEA DX, MSG2         ; Load effective address of MSG2
    INT 21H              ; Print second message

    ; ----- Exit program -----
    MOV AH, 4CH          ; DOS function 4Ch: Exit program
    INT 21H              ; Call interrupt to return to DOS

MAIN ENDP                ; End of the main procedure
END MAIN                 ; End of program (execution starts at MAIN)
