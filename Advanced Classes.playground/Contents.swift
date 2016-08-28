//: Playground - noun: a place where people can play
// using Swift Apprentice

import UIKit


//Introducing Inheritance 

struct Grades {
	var points: Double
	var lettter: String
}

class Person {
	var firstName : String
	var lastName: String
	
	init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
}


class Student: Person{
	var grades : [Grades] = []
}

/*The student class now inherits from Person, indicated by a olon after the naminf of Student

Though inheritance, Student automatically gets the stored properties declared in the Person class, as well as the initializers and any methods

in this code it is accurate to say that a Student "is a Person"

this less code duplication
*/

let martin = Person(firstName: "martin", lastName: "chibwe")
let dan = Student(firstName: "danstan", lastName: "chola")

//A class that inherits from another calss is known as a subclass, and the class from which it inherits as is known as a supercalss or a base calss

///A swift class can inherit from only one other class, a concept known as single inheritance

// there is no limit to the depth of subclassing

class StudentAthlete: Student {
	//and so on a chain of subclasses is called a class hierarchy
}


//Polymorphism 
/*Polymorphism is a programming languages ability to treat an object differently based on context*/


//Inheritance, methods and overrides

class Student2: Person {
	var grades: [Grades] = []
	
	func recordGrades(grade:Grades)  {
		grades.append(grade)
	}
}




// Introducing super

// The super keyword is similar to self, except it will invoke the method in teh nearest implementing superclass.
// it's generally best practice to call the super version of a method first when overriding. 

class StudentAthlete2: Student2 {
	
	var failedClasses : [Grades] = []
	
	override func recordGrades(grade: Grades){
		super.recordGrades(grade)
		
		
		if grade.lettter == "F" {
			failedClasses.append(grade)
		}
	}
	
	func athleteIsEligible() -> Bool {
		return failedClasses.count < 3
	}
	

}

let studentA = StudentAthlete2(firstName: "martin", lastName: "chibwe")


//Preventing inheritance
/*By marking the Student class final, you tell the compiler to prevent any classes from inheriting from Student3

In addition you can make individaul methods as final, if you want to allow a class to have subclasses, but protect individual methods from being oerridden
*/
final class Student3: Person{
	//
	final func recordGrade(grade: Grades){
		//
	}
}

//Build error
/*
class StudentAthelte4: Student3 {
	//
	override func recordGrade(grade: Grades){
	
	}
}
*/

// inheritance and calss initialization 



class StudentAthlete5:Student {
	var sports: [String]
	
//	init(sports: [String]){
//		self.sports = sports
//		//build error - super .init isn't called before
//		// returning from initializer
//	}
	
	
	//The initializer now calls the initializer of its supercalss, and the builder error is gone.
	init(firstName: String, lastName: String,sports: [String]) {
		self.sports = sports
		//two-phrase initialization
		super.init(firstName: firstName, lastName: lastName)
	}
	
}

//:two-phrase initialization
//Swift's requrement that all stored properties have initial values. initializers in subclasses must adhere to swift's convention of two-phase initialization 

/*
phase one: Initialize all of the stored properties in the class instance, from the bottom to the top of the class hierarchy. you can't use properties and methdos until phase 1 is complete

Phase 2: You can now use properties and methods, as well as initializations that require the use of self.
*/

class StudentAthlete6: Student2 {
	var sports: [String]
	
	init(firstName: String, lastName: String, sports: [String]) {
		//1
		self.sports = sports
		//2
		let passGrade = Grades(points: 12.0, lettter: "A")
		//3
		super.init(firstName: firstName, lastName: lastName)
		//4
		recordGrades(passGrade)
	}
}

/*

1.First, you initialize the sports property of StudentAthlete6
2.Although you can create local lvariables for  thigns like grades, you can't call recordGrade(). yet becuse the object is still in the first phase
3. you call super.init. when this return you have initialized every class in the hierarchy, because the same ruels are applied at every level
4. After super.int returns, the initializer is in phase 2, so you call recordGrade()
*/



//Designated initializers
class Student7: Person{
	var grades : [Grades]
	
	//This keyword will force all subclasses of Student to not only implement this initializer, but also use this initializer when they make their calls to supper.init
	override required init(firstName: String, lastName: String) {
		grades = []
		
		super.init(firstName: firstName, lastName: lastName)
	}
	//
}



class StudentAthlete7: Student7 {
	var sports: [String]
	
	//Now required by the compiler!
	override required init(firstName: String, lastName: String) {
		self.sports = []
		super.init(firstName: firstName, lastName: lastName)
	}
	
	init(firstName: String, lastName: String, sports: [String]) {
		self.sports = sports
		super.init(firstName: firstName, lastName: lastName)
		
	}
	

}

/*
Single Responsibility 

iIn software development, there is a guidline known as the single responsiblility principle.  This principle state that any class should have a single concern only, and it should onw all the funciionality it uses.
*/


// Type constraints 

//class Team {
//	var players : [StudentAthlete]
//	func teamEligable() -> Bool {
//		for player in players {
//			if !player.is
//		}
//	}
//}


//Retain cycles and weak references 


//:Challenge A: Visualizing the initialization chain
//
//Create 3 simple classes called A, B, and C where C inherits from B and B inherits from A. In each class initializer, call print("I'm A!") in each respective classes initializer both before and after super.init().
//
//What order do you see each print() called in?
//

class A {
	init(){
		print("I'm A")
	}
}
class B: A {
	override init(){
		print("I'm B")
	}
}
class C: B {
	override init(){
		print("I'm C")
	}
}

//:Challenge B: Deepen the class hierarchy

//:Create a subclass of StudentAthlete called StudentBaseballPlayer and include properties for position, number, and battingAverage.

