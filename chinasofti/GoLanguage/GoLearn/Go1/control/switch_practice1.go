package control

import "fmt"

func TestSwitch1(value int) bool {
	var flag bool
	switch value {
	case 1:
		fmt.Println("====1.1========")
		flag = true
	case 2, 4, 6:
		fmt.Println("====1.2========")
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
		fmt.Println("====2.1========")
		flag = true
	case value < 0:
		fmt.Println("====2.2========")
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
	case []int:
		fmt.Printf("pointer to array %d\n", len(t))
		return true
	}
}

func RunSwitch3() bool {
	// type AAA string
	// var ss AAA = "ppp"
	jj := []int{3, 5, 6, 9, 6}
	// ii := jj[0:]
	return testSwitch3(jj)
}

func TestSwitch4() int {
	a := []byte{1, 5, 1, 0}
	b := []byte{1, 2, 2}
	return compare(a, b)
}

func compare(a, b []byte) int {
	for i := 0; i < len(a) && i < len(b); i++ {
		switch {
		case a[i] > b[i]:
			return 1
		case a[i] < b[i]:
			return -1
		}
	}
	switch {
	case len(a) > len(b):
		return 1
	case len(a) < len(b):
		return -1
	}
	return 0
}
