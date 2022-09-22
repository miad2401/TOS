printStr:
    mov ah, 0x0e

    printStrLoop:
        mov al, [bx]
        cmp al, 0
        je printStrEnd

        int 0x10
        inc bx
        jmp printStrLoop

    printStrEnd:
        ret