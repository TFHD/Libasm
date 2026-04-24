section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_strdup
extern malloc
extern ft_strcpy
extern ft_strlen

ft_strdup:

    ; we calculate the length of the string 
    push rbx
    mov rbx, rdi
    call ft_strlen

    ; malloc(length + 1)
    lea rdi, [rax + 1]
    call malloc wrt ..plt

    ; if malloc return is NULL return NULL
    test rax, rax
    jz .end

    ; copy string to the new string
    mov rdi, rax
    mov rsi, rbx
    call ft_strcpy
    
    pop rbx
    ret

.end:
    pop rbx
    ret
