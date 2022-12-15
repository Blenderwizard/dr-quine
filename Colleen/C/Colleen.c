#include <stdio.h>

char *s = "#include <stdio.h>%c%cchar *s = %c%s%c;%c// Global Scope Comment%cint main(void) {%c    // Main Scope Comment%c    printf(s,10,10,34,s,34,10,10,10,10,10,10);%c}%c";
// Global Scope Comment
int main(void) {
    // Main Scope Comment
    printf(s,10,10,34,s,34,10,10,10,10,10,10);
}
