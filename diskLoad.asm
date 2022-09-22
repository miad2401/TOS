diskLoad:
    push dx

    mov ah, 0x02 
    mov al, dh      ;Number of sectors to read
    mov ch, 0x00    ;Cylinder Number
    mov dh, 0x00     ;Head number
    mov cl, 0x02    ;Sector number
    mov dl, [BOOT_DISK] ;Drive number

    int 0x13        ;BIOS interrupt

    jc diskError

    pop dx
    cmp dh, al
    jne diskError
    ret

diskError:
    mov bx, diskErrorMsg
    call printStr
    jmp $

;Vars
diskErrorMsg db "Disk read error!", 0