package variable11

import "fmt"

func testString1() {
	var a string = "abdewrwer"
	b := a[0]
	c := a[3]
	d := a[0:6]
	fmt.Println(b)
	fmt.Println(c)
	fmt.Println(d)
}

func testString2() {
	var a string = "abdewrwer你"

	fmt.Println(b)
	fmt.Println(c)
	fmt.Println(d)
}

func testRune() {
	var a string = "abdewrwer"
	var c rune = a[5]
}
