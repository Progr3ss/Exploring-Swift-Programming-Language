//: Playground - noun: a place where people can play

import UIKit

//Closures 

/*

A closure is simply a fuction with no name. you can assign them to variables and pass them around like any other values. Being able to create them without needing to create  a fully-formed function makes them more convenient to use and pass around
*/


var multiplyClosure:(Int, Int) -> Int
multiplyClosure = {(a: Int, b: Int) -> Int in

	return a  * b
}


let result = multiplyClosure(10,5)


//Shorthand syntax
multiplyClosure = {(a: Int, b: Int) -> Int  in

	a * b
}


multiplyClosure = {(a: Int, b:Int) in a * b}

let result3 = multiplyClosure(10,4)


multiplyClosure = {(a,b) in a * b}

multiplyClosure = {$0 * $1}


//Function
func operationOnNumbers(a: Int , _ b: Int, operation: (Int, Int) -> Int) -> Int {
	
	let result = operation(a,b)
	print(result)
	return result
	
}


//uses function with a closure 
let addClosure = {(a: Int, b: Int) in  a + b}


operationOnNumbers(4, 4, operation: addClosure)


//Closures are simply functions without names 

func addFunction(a: Int, b: Int) -> Int {
	
	return a + b
}


operationOnNumbers(2, 4, operation: {$0 + $1})


let voidClosure: () -> Void =
{
print("martin is awesome")
}


//Captuirng from the enclosing scope 

var counter = 0
let incrementCounter = { counter += 1}




