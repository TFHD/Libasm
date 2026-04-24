section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_list_sort
extern ft_strcmp

%define NODE_NEXT   8

ft_list_sort:
    push    rbx
    push    r12
    push    r13
    push    r14

    mov r12, [rdi]
    mov r13, rsi

.loop_1:
    mov rax, [r12 + NODE_NEXT]
    test [r12 + NODE_NEXT], rax
    jz .end

    mov r14, [r12 + NODE_NEXT]

.loop_2:
    mov rax, [r14 + NODE_NEXT]
    test rax, rax
    jz .inc

    mov rdi, [r12]
    mov rsi, [r14]
    call r13
    
    cmp rax, 0
    jg .swap

    mov rax, [r14]
    mov [r14 + NODE_NEXT], rax
    xor rax, rax
    jmp .loop_1

.swap:
    mov rbx, [r12]
    mov rax, [r14]
    mov [r12], rax
    mov [r14], rbx
    xor rax, rax

.inc:
    mov rax, [r12]
    mov [r12 + NODE_NEXT], rax
    xor rax, rax
    jmp .loop_1


.end:
    xor rax, rax
    pop     r14
    pop     r13
    pop     r12
    pop     rbx
    ret