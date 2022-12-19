package main

import "fmt"

var s = "package main%c%cimport %cfmt%c%c%cvar s = %c%s%c%c%c/*%cGlobal Scope Comment%c*/%cfunc main() {%c%c/*%c%c  Main Scope Comment%c%c*/%c%cfmt.Printf(s, 10, 10, 34, 34, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10)%c}%c"

/*
Global Scope Comment
*/
func main() {
	/*
	  Main Scope Comment
	*/
	fmt.Printf(s, 10, 10, 34, 34, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10)
}
