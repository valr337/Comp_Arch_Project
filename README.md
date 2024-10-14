# CSC 1104 Computer Architecture project

Ignore folder "old", assembly code for x86_64 linux 

**helloworld.s**

helloworld.o

helloworld.elf

contains code that outputs "helloworld" on raspberry pi 4b, arm64 v8 architecture

Compile instructions for linux(x86_64)

```
aarch64-linux-gnu-as helloworld.s -o helloworld.o 

aarch64-linux-gnu-gcc helloworld.o -o helloworld.elf -nostdlib -static
```

c_code.c

**c_code.s**

contains basic functionality for question 1.2

-requires user input

-exponent function

