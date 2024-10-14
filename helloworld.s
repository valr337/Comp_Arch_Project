# aarch64 asm

.global _start
.section .text

_start:
    #write system call
    mov x8, #64
    mov x0, #1
    ldr x1, =message
    mov x2, #13
    svc 0

    #exit system call
    mov x8, #0x5d
    mov x0, #0x41
    svc 0

.section .data
    message:
    .ascii "Hello, World\n"