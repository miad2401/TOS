[org 0x7c00]
KERNEL_LOCATION equ 0x1000

mov [BOOT_DISK], dl ;Get disk number

xor ax, ax                          
mov es, ax
mov ds, ax
mov bp, 0x8000          ;set stack in the middle of nowhere
mov sp, bp

mov bx, KERNEL_LOCATION
mov dh, 2

call diskLoad

mov ah, 0x0
mov al, 0x3
int 0x10

%include "printStr.asm"
%include "diskload.asm"

BOOT_DISK:
    db 0

jmp $
times 510-($-$$) db 0
dw 0xaa55