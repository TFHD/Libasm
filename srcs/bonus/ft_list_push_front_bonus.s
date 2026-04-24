section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_list_push_front

ft_list_push_front:
    mov rax, [rdi]
    mov [rsi + 8], rax
    mov [rdi], rsi
    ret