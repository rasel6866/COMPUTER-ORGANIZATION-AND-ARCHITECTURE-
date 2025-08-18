.model small
.stack 100h

.data
msg1 db 0dh,0ah,'Enter three alp.character: $'
newline db 0dh, 0ah, '$'

ch1 db ?
ch2 db ?
ch3 db ?

.code 
main proc 
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    mov ch1, al

    mov ah, 1
    int 21h
    mov ch2, al

    mov ah, 1
    int 21h
    mov ch3, al

    add ch1, 32
    add ch2, 32
    add ch3, 32

    mov al, ch1
    cmp al, ch2
    jge ok13
        mov al, ch1
        mov bl, ch2
        mov ch1, bl
        mov ch2, al
ok13:

    mov al, ch1
    cmp al, ch3
    jge ok14
        mov al, ch1
        mov bl, ch3
        mov ch1, bl
        mov ch3, al
ok14:

    mov al, ch2
    cmp al, ch3
    jge ok34
        mov al, ch2
        mov bl, ch3
        mov ch2, bl
        mov ch3, al
ok34:

    mov ah, 2
    mov dl, ch1
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h

    mov ah, 2
    mov dl, ch2
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h

    mov ah, 2
    mov dl, ch3
    int 21h

    mov ah, 4ch
    int 21h
     
main endp
end main
