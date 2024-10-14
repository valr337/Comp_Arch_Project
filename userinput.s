# aarch64 asm

.global _start
.section .text

_start:
    #read system call
    mov x8, #63
    mov x0, #1
    ldr x1, =buffer
    mov x2, #32
    svc 0

    #write system call
    mov x8, #64
    mov x0, #1
    ldr x1, =buffer
    mov x2, #32
    svc 0

    #exit system call
    mov x8, #0x5d
    mov x0, #0x41
    svc 0

.section .data
    message:
    .ascii "Hello, World\n"

    buffer:
    .byte 32