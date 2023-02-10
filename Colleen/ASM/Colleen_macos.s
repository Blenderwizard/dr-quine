; Global Scope Comment
global _main
extern _printf

_other:
    push rbp
    mov rbp, rsp
    lea rdi, [rel code]
    lea rsi, [rel code]
    mov rdx, 10
    mov rcx, 34
    call _printf
    xor rax,rax
    leave
    ret

_main:
    ; Main Scope Comment
    push rbp
    mov rbp, rsp
    call _other
    xor rax,rax
    leave
    ret

section .data
code:
    db "; Global Scope Comment%2$cglobal _main%2$cextern _printf%2$c%2$cother:%2$c    push rbp%2$c    mov rbp, rsp%2$c    lea rdi, [rel code]%2$c    lea rsi, [rel code]%2$c    mov rdx, 10%2$c    mov rcx, 34%2$c    call _printf%2$c    xor rax,rax%2$c    leave%2$c    ret%2$c%2$c_main:%2$c    ; Main Scope Comment%2$c    push rbp%2$c    mov rbp, rsp%2$c    call _other%2$c    xor rax,rax%2$c    leave%2$c    ret%2$c%2$csection .data%2$ccode:%2$c    db %3$c%s%3$c, 0%2$c", 0
