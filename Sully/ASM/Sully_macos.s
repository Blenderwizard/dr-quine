section .text
extern _fprintf
extern _system
extern _fopen
extern _fclose
extern _sprintf
global _main
_main:
    push rbp
    mov rbp, rsp
    mov r12, 5
%ifdef FIRST
    dec r12
%endif
    lea rdi, [rel file]
    lea rsi, [rel file_template]
    mov rdx, r12
    call _sprintf
    lea rdi, [rel file]
    lea rsi, [rel mode]
    call _fopen
    mov r13, rax
    mov rdi, r13
    lea rsi, [rel code]
    lea rdx, [rel code]
    mov rcx, 10
    mov r8, 34
    mov r9, r12
    call _fprintf
    mov rdi, r13
    call _fclose
    lea rdi, [rel cmd1]
    lea rsi, [rel cmd1_template]
    mov rdx, r12
    call _sprintf
    lea rdi, [rel cmd1]
    call _system
    cmp r12, 0
    jle __label_end
    lea rdi, [rel cmd2]
    lea rsi, [rel cmd2_template]
    mov rdx, r12
    call _sprintf
    lea rdi, [rel cmd2]
    call _system
__label_end:
    xor rax, rax
    leave
    ret
section .data
code:
    db "section .text%2$cextern _fprintf%2$cextern _system%2$cextern _fopen%2$cextern _fclose%2$cextern _sprintf%2$cglobal _main%2$c_main:%2$c    push rbp%2$c    mov rbp, rsp%2$c    mov r12, %4$d%2$c%%ifdef FIRST%2$c    dec r12%2$c%%endif%2$c    lea rdi, [rel file]%2$c    lea rsi, [rel file_template]%2$c    mov rdx, r12%2$c    call _sprintf%2$c    lea rdi, [rel file]%2$c    lea rsi, [rel mode]%2$c    call _fopen%2$c    mov r13, rax%2$c    mov rdi, r13%2$c    lea rsi, [rel code]%2$c    lea rdx, [rel code]%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    mov r9, r12%2$c    call _fprintf%2$c    mov rdi, r13%2$c    call _fclose%2$c    lea rdi, [rel cmd1]%2$c    lea rsi, [rel cmd1_template]%2$c    mov rdx, r12%2$c    call _sprintf%2$c    lea rdi, [rel cmd1]%2$c    call _system%2$c    cmp r12, 0%2$c    jle __label_end%2$c    lea rdi, [rel cmd2]%2$c    lea rsi, [rel cmd2_template]%2$c    mov rdx, r12%2$c    call _sprintf%2$c    lea rdi, [rel cmd2]%2$c    call _system%2$c__label_end:%2$c    xor rax, rax%2$c    leave%2$c    ret%2$csection .data%2$ccode:%2$c    db %3$c%1$s%3$c, 0%2$cfile_template:%2$c    db %3$cSully_%%d.s%3$c, 0%2$ccmd1_template:%2$c    db %3$cnasm -f macho64 -dFIRST Sully_%%1$d.s && gcc Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o%3$c, 0%2$ccmd2_template:%2$c    db %3$c./Sully_%%1$d%3$c, 0%2$cmode:%2$c    db %3$cw%3$c, 0%2$ccmd1:%2$c    times 500 db 0%2$ccmd2:%2$c    times 500 db 0%2$cfile:%2$c    times 500 db 0%2$c", 0
file_template:
    db "Sully_%d.s", 0
cmd1_template:
    db "nasm -f macho64 -dFIRST Sully_%1$d.s && gcc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o", 0
cmd2_template:
    db "./Sully_%1$d", 0
mode:
    db "w", 0
cmd1:
    times 500 db 0
cmd2:
    times 500 db 0
file:
    times 500 db 0
