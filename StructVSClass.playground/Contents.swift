//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Value type example
struct S {
	var data: Int = -1
}
var a = S()
var b = a

a.data = 43

print("struct a \(a.data)")
print("struct b \(b.data)")

//Reference type example
class C{
	var data: Int = -1
}
var x = C()
var y = x

x.data = 45

print("clss x \(x.data)")
print("class y \(y.data)")

