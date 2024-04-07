package method

import "fmt"

type Inte int
type Person struct {
	Name string
	Age  int
}

func (m Inte) TestIntReceiver(age int) {
	mm := Inte(age)
	m = mm
}
func (m *Inte) TestIntPointerReceiver(age int) {
	mm := Inte(age)
	*m = mm
	fmt.Printf("===========Inte is %p\n", *m)
}
func (p Person) TestValueReceiver(name string, age int) bool {
	p.Name = name
	p.Age = age
	return false
}

func (p *Person) TestPointerReceiver(name string, age int) bool {
	p.Name = name
	p.Age = age
	return true
}
