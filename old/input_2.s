.set sys_exit, 60
.set sys_read, 0
.set sys_write, 1

.set stdin, 0
.set stdout, 1

.set success, 0
.set buffer_len, 32

.data
b1:
        .byte buffer_len

output_msg:
        .string "You entered: "

.text

.global _start
.intel_syntax noprefix

_start:

    // Read input from the user
    mov rax, sys_read
    mov rdi, stdin
    lea eax, [b1]
    mov rdx, buffer_len
    syscall

    // output_msg
    mov rax, sys_write
    mov rdi, stdout
    lea rsi, [output_msg]
    mov rdx, 13
    syscall

    //2^input_1 * 2^input_2 * input_3 / 8(bits --> bytes)
    //exponent loop
    mov ebx, eax
    call power
    mov eax, edx

    // Output of func
    mov rax, sys_write
    mov rdi, stdout
    lea rsi, [eax]
    mov rdx, 14
    syscall

    // End the program
    mov rax, sys_exit
    mov rdi, success
    syscall

power:
    //jl(jump if less than)
    //jg(jump if more than)
    mov ecx, 0

    cmp ecx, ebx

    mov edx, 1
    mov ax, 2
    mul edx
    //edx = edx * ax multiply result by 2 until loop ends exponent is 2*2*2*2*...*2

    ret

