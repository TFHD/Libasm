section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_strcpy

ft_strcpy:
    xor rax, rax
    
.loop:
    movzx edx, byte [rsi + rax]
    
    ; if *src = NULL return rdi
    test dl, dl
    jz .end
    
    mov byte [rdi + rax], dl

    inc rax
    jmp .loop

.end:
    mov rax, rdi 
    ret
section .note.GNU-stack noalloc noexec nowrite progbits
