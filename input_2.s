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

        // sys_write
        mov rax, sys_write
        mov rdi, stdout
        lea rsi, [output_msg]
        mov rdx, 13
        syscall

        // Write whatever the user entered back out
        mov rax, sys_write
        mov rdi, stdout
        lea rsi, eax
        mov rdx, rax
        syscall

        //2^input_1 * 2^input_2 * input_3 / 8(bits --> bytes)
        //exponent loop
        mov ebx, eax //b1 == 11 input is exponent
        call pw
        mov eax, edx

        // Output of func
        mov rax, sys_write
        mov rdi, stdout
        lea rsi, eax
        mov rdx, 14
        syscall

        // End the program
        mov rax, sys_exit
        mov rdi, success
        syscall

pw:
        //jl(jump if less than)
        //jg(jump if more than)
        mov ecx, 0 //i
        mov edx, 1 //result
        cmp ecx, ebx
        jl ret // exit loop if i < result

        mul edx, edx, 2 //multiply result by 2 until loop ends exponent is 2*2*2*2*...*2



