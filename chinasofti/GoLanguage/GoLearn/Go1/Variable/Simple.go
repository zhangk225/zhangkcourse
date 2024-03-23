package variable11

import "fmt"

func TestString1() {
	var a string = "abdewrwer"
	b := a[0]
	c := a[3]
	d := a[0:6]
	fmt.Printf("Type of b: %Tn;value: ", b, b)
	fmt.Println(c)
	fmt.Println(d)
}

func TestString2() {
	var a string = "abdewrwer你"
	fmt.Println(a)
}

func TestRune() {
	var a rune = '你'
	b := 2
	fmt.Printf("Type of a: %Tn;value: ", a, a)
	fmt.Printf("Type of b: %Tn", b)
}
