//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//:Enumeration 
/*
An enumeration is a list of related values  that define a common type letter you work with values in a type-safe way.

*/

//Declaring an enumeration
enum Month {
	case january
	case February
	case march
}

func schoolSemester(month: Month) -> String{
	switch month {
	case Month.February:
		return "Somthing"
	case Month.march:
		return "Somthing Else"
	default:
		return "Done"
	}
}
