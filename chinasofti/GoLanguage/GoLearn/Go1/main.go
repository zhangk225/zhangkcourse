package main

/*
程序入口必须是package main 且 func main()
*/

//import "fmt"
import (
	"fmt"

	mathClass "ray.com/GoLean/Go1/myPath"
)

func main() { //需要注意的是 { 不能单独放在一行，否则代码在运行时会产生错误
	fmt.Println("Hello, World1!")
	fmt.Println(mathClass.Add(1, 1))
	fmt.Println(mathClass.Sub(1, 1))
	fmt.Println(mathClass.CallOther(1, 1))
}
