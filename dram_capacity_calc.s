# aarch64 asm

.set sys_exit, 93
.set sys_read, 63
.set sys_write, 64
.set lf, 10

.set stdin, 0
.set stdout, 1

.global _start
.section .text

_start:

    #read system call
    mov x8, sys_read
    mov x0, stdout
    ldr x1, =buffer
    mov x2, #32
    svc 0

    #write system call
    mov x8, sys_write
    mov x0, stdout
    ldr x1, =buffer
    mov x2, #32
    svc 0

    #exit system call
    mov x8, sys_exit
    mov x0, stdin
    svc 0

.section .data
    message:
        .ascii "Hello, World\n"
        len = . - message

    buffer:
        .byte 32