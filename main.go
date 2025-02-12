package main

// NOTE: There should be NO space between the comments and the `import "C"` line.

/*
#cgo LDFLAGS: -L./lib -lsample
#include "./lib/sample.h"
#include <stdlib.h>
*/
import "C"
import _"unsafe"

func MoveVMRecFib(n int) int {
	return int(C.moveRecFib(C.int(n)))
}

func MoveVMImpFib(n int) int {
	return int(C.moveImpFib(C.int(n)))
}

func MoveVMLoad() {
	C.movevmload()
}

func main() {
	println(C.fib(14))
	println(C.moveRecFib(14))
	println(C.moveImpFib(14))
}
