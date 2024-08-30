package main

import (
	"fmt"

	variable11 "ray.com/GoLean/Go1/Variable"
	"ray.com/GoLean/Go1/control"
	fu "ray.com/GoLean/Go1/function_study"
	"ray.com/GoLean/Go1/method"
	mathClass "ray.com/GoLean/Go1/myPath"
)

/*
程序入口必须是package main 且 func main()
*/

//import "fmt"

func main() { //需要注意的是 { 不能单独放在一行，否则代码在运行时会产生错误
	fmt.Println("Hello, World1!")
	// testMathClass()
	// testVariable()
	testArraySlices()
	// testControl()
	// testMethod()
	// testDefer()
}

func testMethod() {
	i := method.Inte(20)
	i.TestIntReceiver(30)
	fmt.Printf("Inte is %d\n", i)
	i.TestIntPointerReceiver(50)
	fmt.Printf("Inte is %d\n", i)
	person := new(method.Person)
	person.TestPointerReceiver("Ray", 40)
	fmt.Printf("name is %s; age is %d", person.Name, person.Age)
}

func testMathClass() {
	fmt.Println(mathClass.Add(1, 1))
	// fmt.Println(mathClass.Sub(1, 1))
	// fmt.Println(mathClass.CallOther(1, 1))
}

func testVariable() {
	variable11.Value()
	variable11.TestRune()
}

func testArraySlices() {
	// f := variable11.CreateArray()
	// fmt.Println(f)
	f := variable11.CreateSlices()
	fmt.Println(f)
	// variable11.TestAppend(8)

}
func testControl() {
	// fmt.Println(control.TestSwitch1(5))
	// fmt.Println(control.TestSwitch2(8))
	fmt.Println(control.RunSwitch3())
	// fmt.Println(control.TestSwitch4())
}

func testDefer() {
	// D:/tempProject/tempfile/aaa.txt  function_study/aaa.txt  ../aaa.txt
	aa, err := fu.Contents("function_study/aaa.txt")
	if err == nil {
		fmt.Println("========" + aa)
	}
	// fu.DeferTest1()
	// fu.DeferTest2()
	// fu.DeferTest3()
	fu.DeferTest4()
}
