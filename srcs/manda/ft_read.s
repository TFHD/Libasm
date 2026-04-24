section .note.GNU-stack noalloc noexec nowrite progbits

section .text
global ft_read
extern __errno_location

ft_read:

    ; call read
    xor rax, rax
    syscall

    ; if read result >= 0, return
    cmp rax, 0
    jge .end
    
    ; errno handle
    mov rdx, rax
    call __errno_location wrt ..plt
    neg rdx
    mov dword [rax], edx
    mov rax, -1

.end:
    ret
section .note.GNU-stack noalloc noexec nowrite progbits
