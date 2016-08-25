//: Playground - noun: a place where people can play

import UIKit

/*

A set is an unordered collection of unique values of the same type.


*/


//Creating sets

let setOne: Set<Int>


let setTwo = Set<Int>()


//Set literals 

let someArray = [1,2,3,4,5,1,4]

let someSet: Set<Int>  = [1,2,3,4,5,1,4]


let anotherSet : Set = [1,2,3,1,2,3]


print(anotherSet)



//Acessing elements 

anotherSet.isEmpty
anotherSet.count

anotherSet.first

//Adding and removing elements 
var myTimes: Set = ["8am" , "9am", "10am"]


myTimes.insert("11am")

let removedElemets = myTimes.remove("8am")



//iterating though a set 

for element in myTimes {
	
	
	print(element)
}

let martinTimes: Set = ["11pm","3am","8am","9am"]

//Set operations 

//Union creates a new set with all the values of the two sets
let unionSet = myTimes.union(martinTimes)

//Intersect creates a new set with only the values common to both sets. 

let intersectSet = myTimes.intersect(martinTimes)


//subtract creates a new set by removing values that appear in the second set 

let subtractSet = myTimes.subtract(martinTimes)


//exclusiveOr create a new set with the values that appear in one of the sets, but not both 

let exclusiveOrSet = myTimes.exclusiveOr(martinTimes)




//Challenge



let set1: Set<Int> = [1]
//let set2: = []
let set3 = Set<Int>()


var set4 : Set = [1,2,3]

//set4[1]
set4.contains(3)
set4.insert(1)



//Challenge B 

func checkEmails(email:String, emailSet: Set<String>) -> Bool {

	return emailSet.contains(email)
	
}

//Challenge C 

let day1: Set = ["Anna", "Benny", "Charlie"]
let day2: Set = ["Anna", "Benny", "Danny"]
let day3: Set = ["Anna", "Danny", "Eric"]

func checkAttendance(day1:Set<String>, day2 : Set<String>, day3: Set<String>) -> Set<String> {
	
//	return day1.intersect(day2.intersect(day3))
	return day1.intersect(day2.intersect(day3))
	
	
}


checkAttendance(day1, day2: day2, day3: day3)




