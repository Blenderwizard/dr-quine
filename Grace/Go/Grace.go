package main

import (
	"fmt"
	"os"
)

/*
  Comment
*/
func main() {
	s := "package main%c%cimport (%c%c%cfmt%c%c%c%cos%c%c)%c%c/*%c  Comment%c*/%cfunc main() {%c%cs := %c%s%c%c%cs = fmt.Sprintf(s, 10, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 10, 10, 10, 10, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 10)%c%cb := []byte(s)%c%cos.WriteFile(%cGrace_kid.go%c, b, 0644)%c}%c"
	s = fmt.Sprintf(s, 10, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 10, 10, 10, 10, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 10)
	b := []byte(s)
	os.WriteFile("Grace_kid.go", b, 0644)
}
