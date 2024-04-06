package control

import "fmt"

func TestSwitch1(value int) bool {
	var flag bool
	switch value {
	case 1:
		fmt.Println("====1========")
		flag = true
	case 2, 4, 6:
		fmt.Println("====2========")
		flag = false
	}
	return flag
}

func TestSwitch2(value int) bool {
	var flag bool
	switch {
	default:
		flag = true
	case value > 0:
		fmt.Println("====1========")
		flag = true
	case value < 0:
		fmt.Println("====2========")
		flag = false
	}
	return flag
}

// switch type
func testSwitch3(x interface{}) bool {
	switch t := x.(type) {
	default:
		fmt.Printf("unexpected type %T\n", t) // %T prints whatever type t has
		return false
	case bool:
		fmt.Printf("boolean %t\n", t) // t has type bool
		return true
	case int:
		fmt.Printf("integer %d\n", t) // t has type int
		return true
	case *bool:
		fmt.Printf("pointer to boolean %t\n", *t) // t has type *bool
		return true
	case *int:
		fmt.Printf("pointer to integer %d\n", *t) // t has type *int
		return true
	}
}

func RunSwitch3() bool {
	type AAA string
	var ss AAA = "ppp"
	return testSwitch3(ss)
}
