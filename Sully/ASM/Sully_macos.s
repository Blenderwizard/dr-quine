section .text
extern fprintf
extern system
extern fopen
extern fclose
extern sprintf
global main
main:
    push rbp
    mov rbp, rsp
    mov r12, 5
    dec r12
    lea rdi, [rel file]
    lea rsi, [rel file_template]
    mov rdx, r12
    call sprintf
    lea rdi, [rel file]
    lea rsi, [rel mode]
    call fopen
    mov r13, rax
    mov rdi, r13
    lea rsi, [rel code]
    lea rdx, [rel code]
    mov rcx, 10
    mov r8, 34
    mov r9, r12
    call fprintf
    mov rdi, r13
    call fclose
    cmp r12, 0
    je _label_end
    lea rdi, [rel cmd]
    lea rsi, [rel cmd_template]
    mov rdx, r12
    call sprintf
    lea rdi, [rel cmd]
    call system
_label_end:
    xor rax, rax
    leave
    ret
section .data
code:
    db "section .text%2$cextern fprintf%2$cextern system%2$cextern fopen%2$cextern fclose%2$cextern sprintf%2$cglobal main%2$cmain:%2$c    push rbp%2$c    mov rbp, rsp%2$c    mov r12, %4$d%2$c    dec r12%2$c    lea rdi, [rel file]%2$c    lea rsi, [rel file_template]%2$c    mov rdx, r12%2$c    call sprintf%2$c    lea rdi, [rel file]%2$c    lea rsi, [rel mode]%2$c    call fopen%2$c    mov r13, rax%2$c    mov rdi, r13%2$c    lea rsi, [rel code]%2$c    lea rdx, [rel code]%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    mov r9, r12%2$c    call fprintf%2$c    mov rdi, r13%2$c    call fclose%2$c    cmp r12, 0%2$c    je _label_end%2$c    lea rdi, [rel cmd]%2$c    lea rsi, [rel cmd_template]%2$c    mov rdx, r12%2$c    call sprintf%2$c    lea rdi, [rel cmd]%2$c    call system%2$c_label_end:%2$c    xor rax, rax%2$c    leave%2$c    ret%2$csection .data%2$ccode:%2$c    db %3$c%1$s%3$c, 0%2$cfile_template:%2$c    db %3$cSully_%%d.s%3$c, 0%2$ccmd_template:%2$c    db %3$cnasm -f elf64 Sully_%%1$d.s && gcc Sully_%%1$d.o -o Sully_%%1$d && ./Sully_%%1$d%3$c, 0%2$cmode:%2$c    db %3$cw%3$c, 0%2$ccmd:%2$c    times 500 db 0%2$cfile:%2$c    times 500 db 0%2$c", 0
file_template:
    db "Sully_%d.s", 0
cmd_template:
    db "nasm -f elf64 Sully_%1$d.s && gcc Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0
mode:
    db "w", 0
file:
    times 500 db 0
cmd:
    times 500 db 0