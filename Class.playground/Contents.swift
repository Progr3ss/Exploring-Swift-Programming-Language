//: Playground - noun: a place where people can play

import UIKit


/**

Reference types of value types

Class initializers are functions marked init, and all stored properties must have initial values bbefore the end of init , unless they are optionals
*/

class Person{
	
	
	var firstName: String
	var lastName : String
	
	
	func FullName() -> String {
		return "\(firstName) \(lastName)"
	}
	
	init(firstName: String, lastName:String){
		
		self.firstName = firstName
		self.lastName = lastName
		
	
	}
	
}
let martin = Person(firstName: "Martin", lastName: "Chibwe")

martin.FullName()


//Reference Type

// Heap vs. Stack 

/*


When you create a referece type such as class, the system stores the actual value in a region of memory known as the heap

A value type such as a struct resides in the region of memory called the stack 


The system uses the stack to store anything on the immediate thread of the execution; it is tightyly manged and optimized by the CPU. Since the stack is so well organized, it's very efficient , and thus quite fast

The system uses the heap to store data referenced by other objecets. the heap is generally a large poop of memory from which the system can request and dynamically allocate blocks of memory. The heap doesn't automaticay destroy its objexts like the stack does, so you're responsibile for both allocating and deallocating.  This makes creating and removing data on the heap a slower process, compared to on th stack.


*/




//Workign with references 


martin.firstName = "Dan"
print(martin.firstName)

print(martin.FullName())


//Object identity 

// the == operator check if two values are equal, the ===  identity operatro compares the memory address of two refferences
var imposter = Person(firstName: "John", lastName: "Chris")

martin === imposter


//MARK: - Methods and mutablility 

struct Grades{
	let letter: String
	let points: Double
	let credits: Double
}


class Student2  {
	
	var firstName: String
	var lastName: String
	var grades: [Grades] = []
	
	
	init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
	
	func recordGrade(grade: Grades)  {
		grades.append(grade)
	}
}


//let chibwe = Student(firstName: "Martn", lastName: "Chibwe")
//let ComputerScience = Grades(letter: "A", points: 100.0, credits: 100.0)

//chibwe.recordGrade(ComputerScience)
//
//print(chibwe.grades)



//Introducing access controll 
/*
public: Entities are available to code inside the module it is defined in, as ell as any module importing the module it is defined in

interanl: Entities are abilable to code inside the module it is defined in , but not to code in a module that imports the module it is defined in 

private: Entities are available only to the same file they are defined in 


*/



public var publicString: String = "Eneryone can see me !"


internal class InternalClass{
	private func sayHi(){
		print("Hello")
	}
	
	
	//interanl by defaul 
	func speak()  {
		sayHi()
	}
}


let myClass = InternalClass()
myClass.sayHi()
myClass.speak()



//Understnading State and side effects 
class Student  {
	
	var firstName: String
	var lastName: String
	var credit: Double = 0.0
	var grades: [Grades] = []
	
	
	init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
	
	func recordGrade(grade: Grades)  {
		grades.append(grade)
		credit += grade.credits
	}
}


let chibwe = Student(firstName: "Martn", lastName: "Chibwe")
let ComputerScience = Grades(letter: "A", points: 100.0, credits: 100.0)

let math = Grades(letter: "A", points: 100.0, credits: 90.0)
chibwe.recordGrade(math)
chibwe.recordGrade(ComputerScience)




//Challenge A: Movie list -benefits of reference types 

/*
Imgine you're writing  a movie-viewing applicaiton in swfit. Users can create "list" of movies and share those lists with other users. 

Create a User and List class that uses refeerence semantics to help maintain lists between users


*/

class User{
	var lists: [String: List] = [:]
	
	func addList(list: List)  {
		lists[list.name] = list
		
	}
	
	func listForName(name: String) -> List? {
		return lists[name]
	}
}

class List{
	let name: String
	
	var moives: [String] = []
	
	init(name: String){
		self.name = name
	}
	
	func printList()  {
		print("Moive List: \(name)")
		for movie in moives{
			print(movie)
			
		}
		print()
	}
}

let jane = User()
let Actionlist = List(name: "Action")
jane.addList(Actionlist)
jane.lists["Action"]?.moives.append("Rambo")
jane.lists["Action"]?.printList()


//class Movie {
//	
//	var genre:String
//	var location: String
//	var list : [List] = []
//	var rating : Double =  0.0
//	
//	
//	init(genre:String, location:String){
//		
////		self. = title
//		self.genre = genre
//		self.location = location
//
//		
//		
//	}
//	
//	func addList(lists:List)  {
//		list.append(lists)
//		rating += lists.rating!
//	}
//	
//	
//
//}
//
//
//
//
//var martin2 = Movie(genre: "Action", location: "U.S.A")
//var list = List(title: "eating pizza", director: "unkown", rating: 3.4)
//var list2 = List(title: "Jumping", director: "mr. bubbles", rating: 5.0)
//
//martin2.addList(list)
//martin2.addList(list2)


