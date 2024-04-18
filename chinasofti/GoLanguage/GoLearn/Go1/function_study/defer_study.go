package function_study

import (
	"fmt"
	"io"
	"os"
)

func Contents(filename string) (string, error) {
	f, err := os.Open(filename)
	if err != nil {
		return "", err
	}
	defer f.Close() // f.Close will run when we're finished

	var result []byte
	buf := make([]byte, 100)
	for {
		n, err := f.Read(buf[0:])
		result = append(result, buf[0:n]...) //append is discussed later
		if err != nil {
			if err == io.EOF {
				break
			}
			return "", err // f will be closed if we return here
		}
	}
	return string(result), nil // f will be closed if we return here
}

func DeferTest1() {
	for i := 0; i < 5; i++ {
		defer fmt.Printf("%d ", i)
	}
}

func DeferTest2() {
	var m string = "a"
	trace2(m)
	m = "b"
	defer untrace2(m)
	m = "c"
	fmt.Println("execute DeferTest2")
}

func DeferTest3() {
	var m string = "a"
	defer untrace3(trace3(m))
	m = "b"
	fmt.Println("execute DeferTest3")
}

func DeferTest4() {
	defer untrace3(trace3("4"))
	fmt.Println("execute DeferTest4")
	DeferTest3()
}

func trace2(s string) {
	fmt.Println("entering:", s)
}

func untrace2(s string) {
	fmt.Println("leaving:", s)
}

func trace3(s string) string {
	fmt.Println("entering:", s)
	return s
}

func untrace3(s string) {
	fmt.Println("leaving:", s)
}
