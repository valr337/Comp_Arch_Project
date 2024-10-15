# aarch64 asm

    #standard constants
.set sys_exit, 93
.set sys_read, 63
.set sys_write, 64
.set lf, 10

.set stdin, 0
.set stdout, 1

.global main
.type	main, %function
.section .text

main:

// /usr/aarch64-linux-gnu/include/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	ldr	w2, [sp, 4]	//, x
	adrp	x1, .LC1	// tmp99,
	add	x1, x1, :lo12:.LC1	//, tmp99,
	mov	w0, 2	//,
	bl	__printf_chk		//

    // c_1.c:7:     scanf("%d",&x);
	add	x1, sp, 4	//,,
	adrp	x0, .LC0	// tmp97,
	add	x0, x0, :lo12:.LC0	//, tmp97,
	bl	__isoc99_scanf		//

    bl	__printf_chk

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
        .byte 1