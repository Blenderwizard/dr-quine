#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int count = 5;
char *s = "#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <unistd.h>%2$c%2$cint count = %4$d;%2$cchar *s = %3$c%1$s%3$c;%2$c%2$cint main() {%2$c    count--;%2$c    char s1[100];%2$c    sprintf(s1, %3$cSully_%%d.c%3$c, count);%2$c    FILE *fptr = fopen(s1, %3$cw%3$c);%2$c    fprintf(fptr, s, s, 10, 34, count, 92);%2$c    fclose(fptr);%2$c    if (count) {%2$c        char cmd[500];%2$c        sprintf(cmd, %3$cbash -c %5$c%3$cgcc Sully_%%1$d.c -o Sully_%%1$d && ./Sully_%%1$d%5$c%3$c%3$c, count);%2$c        system(cmd);%2$c    }%2$c}%2$c";

int main() {
    count--;
    char s1[100];
    sprintf(s1, "Sully_%d.c", count);
    FILE *fptr = fopen(s1, "w");
    fprintf(fptr, s, s, 10, 34, count, 92);
    fclose(fptr);
    if (count) {
        char cmd[500];
        sprintf(cmd, "bash -c \"gcc Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d\"", count);
        system(cmd);
    }
}