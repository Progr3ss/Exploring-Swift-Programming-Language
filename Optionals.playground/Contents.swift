//: Playground - noun: a place where people can play

import UIKit

/*
Optionals, a special Swift type that can represent not just a value, but also the absence of a value.

*/


// Nil is the name given to the absence of a value. 

/*
Swift introudc3s a whole new type, called an optional to handle the possibility that a value is nil or not
*/


//Declare an optional
var errorCode: Int?

//when the value has an assignment 
errorCode = 100
// when the value has no assignment 
errorCode = nil



//Unwrapping optionasl 

let ageInteger : Int? = 30
print(ageInteger)

//Force unwrapping (!)

print(ageInteger!)

//use the Force with caution 

var authorName:String? = "martin"
authorName = nil

//var unwrappedAuthorame = authorName! authorName is nill 



//if let binding 
if authorName != nil{
	var unwrapped = authorName!
	
}else{
	print("No author")
}



// multiple value unwrapped

let name: String? = "martin chibwe"
let autherAge : Int = 26

if let name: String = name, autherAge: Int = autherAge{
	
	print("name \(name) and age \(autherAge)")
}else{
	print("No author or age ")
}






