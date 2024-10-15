	.arch armv8-a
	.file	"c_code.c"
// GNU C17 (Ubuntu 13.2.0-23ubuntu4) version 13.2.0 (aarch64-linux-gnu)
//	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mlittle-endian -mabi=lp64 -Og -finline-functions -fno-asynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection
	.text
	.align	2
	.global	pw
	.type	pw, %function
pw:
.LFB24:
	.cfi_startproc
	mov	w3, w0	// base, tmp97
// c_code.c:18:     int result = 1;
	mov	w0, 1	// <retval>,
// c_code.c:20:     for (i = 0; i < exp; i++)
	mov	w2, 0	// i,
// c_code.c:20:     for (i = 0; i < exp; i++)
	b	.L2		//
.L3:
// c_code.c:21:         result *= base;
	mul	w0, w0, w3	// <retval>, <retval>, base
// c_code.c:20:     for (i = 0; i < exp; i++)
	add	w2, w2, 1	// i, i,
.L2:
// c_code.c:20:     for (i = 0; i < exp; i++)
	cmp	w2, w1	// i, exp
	blt	.L3		//,
// c_code.c:24: }
	ret	
	.cfi_endproc
.LFE24:
	.size	pw, .-pw
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"Number: %i"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB23:
	.cfi_startproc
	sub	sp, sp, #32	//,,
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, 16]	//,,
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 16	//,,
// c_code.c:5: int main(){
	adrp	x0, :got:__stack_chk_guard	// tmp95,
	ldr	x0, [x0, :got_lo12:__stack_chk_guard]	// tmp95,
	ldr	x1, [x0]	// tmp105,
	str	x1, [sp, 8]	// tmp105, D.5059
	mov	x1, 0	// tmp105


// c_code.c:9:     scanf("%d",&x);
	add	x1, sp, 4	//,,
	adrp	x0, .LC0	// tmp98,
	add	x0, x0, :lo12:.LC0	//, tmp98,
	bl	__isoc99_scanf		//

// c_code.c:11:     printf("Number: %i",pw(2,x));
	ldr	w1, [sp, 4]	//, x
	mov	w0, 2	//,
	bl	pw		//
// /usr/aarch64-linux-gnu/include/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	mov	w2, w0	//, tmp104
	adrp	x1, .LC1	// tmp101,
	add	x1, x1, :lo12:.LC1	//, tmp101,
	mov	w0, 2	//,
	bl	__printf_chk		//
// c_code.c:14: }
	adrp	x0, :got:__stack_chk_guard	// tmp103,
	ldr	x0, [x0, :got_lo12:__stack_chk_guard]	// tmp103,
	ldr	x2, [sp, 8]	// tmp106, D.5059
	ldr	x1, [x0]	// tmp107,
	subs	x2, x2, x1	// tmp106, tmp107
	mov	x1, 0	// tmp107
	bne	.L7		//,
	mov	w0, 0	//,
	ldp	x29, x30, [sp, 16]	//,,
	add	sp, sp, 32	//,,
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret	
.L7:
	.cfi_restore_state
	bl	__stack_chk_fail		//
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
