; Global Scope Comment
global main
extern printf

other:
    push rbp
    mov rbp, rsp
    lea rdi, [rel code]
    lea rsi, [rel code]
    mov rdx, 10
    mov rcx, 34
    call printf
    xor rax,rax
    leave
    ret

main:
    ; Main Scope Comment
    push rbp
    mov rbp, rsp
    call other
    xor rax,rax
    leave
    ret

section .data
code:
    db "; Global Scope Comment%2$cglobal main%2$cextern printf%2$c%2$cother:%2$c    push rbp%2$c    mov rbp, rsp%2$c    lea rdi, [rel code]%2$c    lea rsi, [rel code]%2$c    mov rdx, 10%2$c    mov rcx, 34%2$c    call printf%2$c    xor rax,rax%2$c    leave%2$c    ret%2$c%2$cmain:%2$c    ; Main Scope Comment%2$c    push rbp%2$c    mov rbp, rsp%2$c    call other%2$c    xor rax,rax%2$c    leave%2$c    ret%2$c%2$csection .data%2$ccode:%2$c    db %3$c%s%3$c, 0%2$c", 0
