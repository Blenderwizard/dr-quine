; Comment
%define PRIMARY main:
%define FILE "Grace_kid.s"
%define CODE "; Comment%2$c%%define PRIMARY main:%2$c%%define FILE %3$c%4$s%3$c%2$c%%define CODE %3$c%1$s%3$c%2$csection .text%2$cextern _fprintf%2$cextern _fopen%2$cglobal _main%2$c%2$cPRIMARY%2$c    push rbp%2$c    mov rbp, rsp%2$c    lea rdi, [rel file]%2$c    lea rsi, [rel mode]%2$c    call fopen%2$c    mov rdi, rax%2$c    lea rsi, [rel code]%2$c    lea rdx, [rel code]%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    lea r9, [rel file]%2$c    call fprintf%2$c    xor rax, rax%2$c    leave%2$c    ret%2$c%2$csection .data%2$ccode:%2$c    db CODE, 0%2$cfile:%2$c    db FILE, 0%2$cmode:%2$c    db %3$cw%3$c, 0%2$c"
section .text
extern _fprintf
extern _fopen
global _main

PRIMARY
    push rbp
    mov rbp, rsp
    lea rdi, [rel file]
    lea rsi, [rel mode]
    call _fopen
    mov rdi, rax
    lea rsi, [rel code]
    lea rdx, [rel code]
    mov rcx, 10
    mov r8, 34
    lea r9, [rel file]
    call _fprintf
    xor rax, rax
    leave
    ret

section .data
code:
    db CODE, 0
file:
    db FILE, 0
mode:
    db "w", 0
