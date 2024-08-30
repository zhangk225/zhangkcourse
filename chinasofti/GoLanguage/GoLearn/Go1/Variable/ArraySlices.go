package variable11

import "fmt"

/**
 * 1. Arrays are values. Assigning one array to another copies all the elements
 * 2. In particular, if you pass an array to a function, it will receive a copy of the array,not a pointer to it
 * 3. The size of an array is part of its type.The types [10]int and [20]int are distinct
 **/
func CreateArray() float64 {
	p := [...]float64{7.0, 8.5, 9.1}
	x := sumArray(p) //Note the explicit address-of operator
	for _, i := range p {
		fmt.Println("====CreateArray======", i)
	}
	return x
}

func sumArray(p [3]float64) (su float64) {
	fmt.Printf("%T\n", p)
	p[0] = 6.3
	for _, i := range p {
		su += i
	}
	return su
}

/**
 * 1. Slices hold references to an underlying array
 * 2. if you assign one slice to another, both refer to the same array.
 * 3. if a function takes a slice argument, changes it makes to the elements of the elements of the slice will be
 *    visible to the caller, analogous to passing a pointer to the underlying array.
 **/
func CreateSlices() float64 {
	//1. allocates slice structure
	// var p *[]int = new([]int) //*p == nil; rarely useful
	//2. use make function to allocates slice structure
	//var v []int = make([]int,100) // the slice v now refers to a new array of 100 ints
	//3. Unnecessarily complex:
	// var p *[]int = new([]int)
	// *p = make([]int, 100, 100)
	//4. Idiomatic:
	p := make([]float64, 20)
	for i := 0; i < 10; i++ {
		p[i] = float64(i) * float64(1.5)
	}
	x := sumSlice(p) //Note the explicit address-of operator
	for _, i := range p {
		fmt.Println("====CreateSlice======", i)
	}
	return x
}

func sumSlice(p []float64) (su float64) {
	fmt.Printf("%T\n", p)
	p[0] = 6.3
	for _, i := range p {
		su += i
	}
	return su
}

func append(slice, data []byte) []byte {
	l := len(slice)
	if l+len(data) > cap(slice) { // reallocate
		// Allocate double what's needed, for future growth.
		newSlice := make([]byte, (l+len(data))*2)
		// The copy function is predeclared and works for any slice type.
		copy(newSlice, slice)
		slice = newSlice

	}
	slice = slice[0 : l+len(data)]
	copy(slice[l:], data)
	return slice
}

func TestAppend(num int) {
	slice := make([]byte, num)
	data := make([]byte, num)
	for i := 0; i < num; i++ {
		slice[i] = byte(i + 1)
		data[i] = byte(i + 1 + num)
	}
	fmt.Println(append(slice, data))
}
