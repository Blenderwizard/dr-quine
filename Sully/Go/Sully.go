package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	count := 5
	count--
	file := fmt.Sprintf("Sully_%d.go", count)
	s := "package main%c%cimport (%c%c%cfmt%c%c%c%cos%c%c%c%cos/exec%c%c)%c%cfunc main() {%c%ccount := %d%c%ccount--%c%cfile := fmt.Sprintf(%cSully_%%d.go%c, count)%c%cs := %c%s%c%c%cs = fmt.Sprintf(s, 10, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 10, 10, 9, count, 10, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 9, 34, 34, 34, 34, 10, 9, 10, 10)%c%cb := []byte(s)%c%cos.WriteFile(file, b, 0644)%c%cif count != 0 {%c%c%ccmd := %cgo build -o Sully_%%d Sully_%%d.go && ./Sully_%%d%c%c%c%ccmd = fmt.Sprintf(cmd, count, count, count)%c%c%cexec.Command(%cbash%c, %c-c%c, cmd).Run()%c%c}%c}%c"
	s = fmt.Sprintf(s, 10, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 10, 10, 9, count, 10, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 9, 34, 34, 34, 34, 10, 9, 10, 10)
	b := []byte(s)
	os.WriteFile(file, b, 0644)
	if count != 0 {
		cmd := "go build -o Sully_%d Sully_%d.go && ./Sully_%d"
		cmd = fmt.Sprintf(cmd, count, count, count)
		exec.Command("bash", "-c", cmd).Run()
	}
}
