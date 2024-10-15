# aarch64 asm

.data
    input_msg1:
        .asciz "Type a number: \n"

.text
.global main
main:

    stp x19, x30, [sp, #-16]! // Keep x19 and x30 (link register)
    sub sp, sp, #16           // Grow the stack because for a local
                              // variable used by scanf.

    //printf
	ldr x1, input_msg1_address
	bl	__printf_chk		//

    add sp, sp, #16          // Shrink the stack.
    ldp x19, x30, [sp], #16  // Restore x19 and x30 (link register)
    ret                      // Leave the function

input_msg1_address: .dword input_msg1
