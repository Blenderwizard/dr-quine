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
	s := "package main%c%cimport (%c%c%cfmt%c%c%c%cos%c%c%c%cos/exec%c%c)%c%cfunc main() {%c%ccount := %d%c%ccount--%c%cfile := fmt.Sprintf(%cSully_%%d.go%c, count)%c%cs := %c%s%c%c%cs = fmt.Sprintf(s, 10, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 10, 10, 9, count, 10, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 34, 34, 34, 34, 10, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10)%c%cb := []byte(s)%c%cos.WriteFile(file, b, 0644)%c%ccmd1 := %cgo build -o Sully_%%d Sully_%%d.go%c%c%ccmd1 = fmt.Sprintf(cmd1, count, count)%c%cexec.Command(%cbash%c, %c-c%c, cmd1).Run()%c%cif count != 0 {%c%c%ccmd2 := %c./Sully_%%d%c%c%c%ccmd2 = fmt.Sprintf(cmd2, count)%c%c%cexec.Command(cmd2).Run()%c%c}%c}%c"
	s = fmt.Sprintf(s, 10, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 10, 10, 9, count, 10, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 34, 34, 34, 34, 10, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10)
	b := []byte(s)
	os.WriteFile(file, b, 0644)
	cmd1 := "go build -o Sully_%d Sully_%d.go"
	cmd1 = fmt.Sprintf(cmd1, count, count)
	exec.Command("bash", "-c", cmd1).Run()
	if count != 0 {
		cmd2 := "./Sully_%d"
		cmd2 = fmt.Sprintf(cmd2, count)
		exec.Command(cmd2).Run()
	}
}
