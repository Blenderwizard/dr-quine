#include <stdio.h>

#define NEW_FILE "Grace_kid.c"
#define INTERNALS "#include <stdio.h>%2$c%2$c#define NEW_FILE %3$c%4$s%3$c%2$c#define INTERNALS %3$c%1$s%3$c%2$c#define macro() int main(){fprintf(fopen(NEW_FILE, %3$cw%3$c), INTERNALS, INTERNALS, 10, 34, NEW_FILE);}%2$c// Comment%2$cmacro()%2$c"
#define macro() int main(){fprintf(fopen(NEW_FILE, "w"), INTERNALS, INTERNALS, 10, 34, NEW_FILE);}
// Comment
macro()
