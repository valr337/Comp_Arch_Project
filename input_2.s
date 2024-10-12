.set sys_exit, 60
.set sys_read, 0
.set sys_write, 1

.set stdin, 0
.set stdout, 1

.set success, 0
.set buffer_len, 64

.data
b1:
        .byte buffer_len

b2:
        .byte buffer_len

b3:
        .byte buffer_len

m1:
        .string "Key in a positive decimal as the number of row address bits: \n"
        //62
m2:
        .string "Key in a positive decimal as the number of column address bits: \n"
        //65
m3:
        .string "Key in a positive decimal as the number of data bits in DRAM: \n"
        //62

.text

.global _start
.intel_syntax noprefix

_start:

        // sys_write m1
        mov rax, 1
        mov rdi, 1
        lea rsi, [m1]
        mov rdx, 62
        syscall

        // Read input from the user
        mov rax, sys_read
        mov rdi, stdin
        lea rsi, [b1]
        mov rdx, buffer_len
        syscall

        // sys_write m2
        mov rax, 1
        mov rdi, 1
        lea rsi, [m2]
        mov rdx, 62
        syscall

        // Read input from the user
        mov rax, sys_read
        mov rdi, stdin
        lea rsi, [b2]
        mov rdx, buffer_len
        syscall

        // sys_write m3
        mov rax, 1
        mov rdi, 1
        lea rsi, [m3]
        mov rdx, 62
        syscall

        // Read input from the user
        mov rax, sys_read
        mov rdi, stdin
        lea rsi, [b3]
        mov rdx, buffer_len
        syscall

        // Read input from the user
        mov rax, sys_read
        mov rdi, stdin
        lea rsi, [b1]
        mov rdx, buffer_len
        syscall


        // Write whatever the user entered back out
        mov rdx, rax
        mov rax, sys_write
        mov rdi, stdout
        lea rsi, [b1]
        syscall

        // End the program
        mov rax, sys_exit
        mov rdi, success
        syscall