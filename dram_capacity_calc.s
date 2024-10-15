# aarch64 asm


#standard constants
.set sys_exit, 93
.set sys_read, 63
.set sys_write, 64
.set lf, 10

.set stdin, 0
.set stdout, 1

.data
    input_msg1:
        .asciz "Please type a number: "
    scanf_fmt : .asciz "%d"
    msg_output: .asciz "Fibonacci number %d is %ld\n"

.global main
.type	main, %function
.section .text

main:

	stp	x29, x30, [sp, -16]!	//,,,
	mov	x29, sp	//,
    //printf
	adrp	x1, .message	// tmp94,
	add	x1, x1, :lo12:.message	//, tmp94,
	mov	w0, 2	//,
	bl	__printf_chk		//
// c_1.c:8: }
	mov	w0, 0	//,
	ldp	x29, x30, [sp], 16	//,,,
	ret

.message:
	.string	"Hello\n"
	.text
	.align	2

.section .data
    message:
        .ascii "Hello, World\n"
        len = . - message

    buffer:
        .byte 1