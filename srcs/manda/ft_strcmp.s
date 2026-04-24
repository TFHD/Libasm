section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax

.loop:
    mov cl, byte [rdi]
    mov dl, byte [rsi]
    
    ; if *string1 != *string2, calculate diff 
    cmp cl, dl
    jne .diff

    ; if *string1 = 0, return 0
    test cl, cl
    jz .equal

    inc rdi
    inc rsi
    jmp .loop

.diff:
    movzx eax, cl
    movzx ecx, dl
    sub eax, ecx
    ret

.equal:
    xor rax, rax
    ret
