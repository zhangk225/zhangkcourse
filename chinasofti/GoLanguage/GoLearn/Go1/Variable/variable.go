package variable11

import "fmt"

func Value() {
	var i int = 1
	j := i
	i = 2
	fmt.Println(i, j)
	fmt.Printf("变量的地址: %x\n", &i)
}
