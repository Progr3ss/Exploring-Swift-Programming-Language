//: Playground - noun: a place where people can play

import UIKit




/*
An array is an ordered collection of values of the same type. The Elements in the array are zero-indexed, which means the first element is 0, the index of the second element is 1 and so on.

*/


//Explicit declaration
let numbers : Array<Int>
// The type inside the angle brackes define the type of values the array can store.


//Inferred declaration 

let inferredNumbers = Array<Int>()

// empty array

//shorter way 
let shortInferredNumbers = [Int]()


//Array liteerals 
let evenNumbers = [1,2,3,4,5]

let allZeros = [Int](count: 5, repeatedValue:3)


//Accessing elements

var players = ["Alcie", "Martin", "Cindy", "Dan"]

//checking elements
players.isEmpty
players.capacity
players.count
players.description
players.endIndex
players.insert("chibwe", atIndex: 4)
players.count
players.popLast()
players.capacity
players.count
//players.removeAll(keepCapacity: false)
players.capacity
players.count


var currentPlayer = players.first
var lastPlayer = players.last

currentPlayer = players.minElement()
players.maxElement()


// minElements vs first
let test = [4,3,2,1]

test.first
test.minElement()
test.maxElement()


//Using subscripting
var firstPlayer = players[0]

//Using ranges
let upcommingPlayers = players[2...3]


//checking for an element 


func isPlayerEliminated(playerName: String) -> Bool{
	
	if players.contains(playerName){
		return true
	}else {
		return false
	}
}

isPlayerEliminated("martin")


//Manipulating elements 

//appending elements 

players.append("chibwe")
players += ["James"]


//inserting 
players.insert("Frank", atIndex: 5)


//removing elements 

var removedPlayer = players.removeFirst()
removedPlayer = players.removeLast()
removedPlayer = players.removeAtIndex(0)



//updating elements 
players[3..<4] = ["John","Danstan"]
players

//Moving elements 
players = players.sort()

//iterating through an array 

for names in players {
	print(names)
}

//reduce 
let scores = [1,2,3,4,5]
let sum = scores.reduce(0, combine: +)

//filter 
print(scores.filter({$0 > 3}))

//map 
print(scores.map({$0 * 2}))











