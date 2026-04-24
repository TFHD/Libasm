section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_list_sort
extern ft_strcmp

%define NODE_NEXT   8

ft_list_sort:
    push rbx
    push r12
    push r13

    ; rdi = begin_list
    ; rsi = cmp
    mov  r13, rsi

    test rdi, rdi
    je   .ret

    test r13, r13
    je   .ret

    ; if *begin_list (node) == NULL, return
    mov  rbx, [rdi]
    test rbx, rbx
    je   .ret

.loop_1:
    ; if node_next == NULL, return
    mov  rax, [rbx + NODE_NEXT]
    test rax, rax
    je   .ret

    mov  r12, rax

.loop_2:
    test r12, r12
    je   .end_loop_2

    ; call cmp(list_ptr->data, next_node->data)
    mov  rdi, [rbx]
    mov  rsi, [r12]
    call r13

    ; if (eax > 0) swap data pointers
    test eax, eax
    jle  .no_swap

    mov  rdx, [rbx]
    mov  rcx, [r12]
    mov  [rbx], rcx
    mov  [r12], rdx

.no_swap:
    mov  r12, [r12 + NODE_NEXT]
    jmp  .loop_2

.end_loop_2:
    mov  rbx, [rbx + NODE_NEXT]
    jmp  .loop_1

.ret:
    pop  r13
    pop  r12
    pop  rbx
    ret