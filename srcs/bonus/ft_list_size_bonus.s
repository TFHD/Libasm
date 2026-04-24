section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_list_size

%define NODE_VALUE  0
%define NODE_NEXT   8
%define NODE_SIZE   16

ft_list_size:
    xor rax, rax

.loop:
    test rdi, rdi
    jz .end

    inc rax

    mov rdi, [rdi + NODE_NEXT]
    jmp .loop

.end:
    ret