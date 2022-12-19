#include <stdio.h>

char *s = "#include <stdio.h>%1$c%1$cchar *s = %2$c%3$s%2$c;%1$c/*%1$c  Global Scope Comment%1$c*/%1$cint main(void) {%1$c    /*%1$c      Main Scope Comment%1$c    */%1$c    printf(s,10,34,s);%1$c}%1$c";
/*
  Global Scope Comment
*/
int main(void) {
    /*
      Main Scope Comment
    */
    printf(s,10,34,s);
}
