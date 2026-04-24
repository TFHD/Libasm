section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_strlen

ft_strlen:
    xor rax, rax

.loop:
    cmp byte [rdi + rax], 0
    je .end
    inc rax
    jmp .loop

.end:
    ret
