[org 0x7c00]

buffer:
    mov ah, 0
    int 0x16
    cmp ah, 0x1c ;if enter is pressed, print the buffer
    je preparePrint
    mov bx, cx
    mov [0x9c+bx], al ;store the char in buffer at 0x9c
    inc cx
    jmp buffer

preparePrint:
    push cs
    pop ds ;makes the data segment the current code segment
    mov si, 0x9c ;loads the buffer

printLoop:
    lodsb ;load string from ds into al
    mov ah, 0x0e
    mov bh, 0
    int 0x10
    dec cx
    cmp cx, 0
    jne printLoop

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa