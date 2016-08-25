//: Playground - noun: a place where people can play

import UIKit



/*

A dictionary is an unordered collection of paris, where each pair is comprised of a key and a vaue

How is this different from an array? WIth an array, you can only fetch a value yb its index, which has to be an integer, and all indexes have to be sequenctial.
*/

//Creating dictinaries 

let pairs: Dictionary<String, Int>
//This is similar to an explicit declaration of an array, but have to types. the type of the keys and values

//Inferred declaration
let alsoInferredpairs = [String: Int]()

//Dictionaray literals 

let namesAndScore = ["Anna": 2, "Brian" : 3, "Martin":26]


var emptyDictionary: [Int:Int]

//Accessing values
namesAndScore["Martin"]

namesAndScore.isEmpty
namesAndScore.count
namesAndScore.description

Array(namesAndScore.keys)
Array(namesAndScore.values)


//Modifying dictionaries
var martinData = ["names": "Martin"]
martinData.updateValue("CA", forKey: "state")
martinData
martinData["lastName"] = "Chibwe"
martinData


//Removing pairs
martinData.removeValueForKey("lastName")
martinData


//Iterating through dictionaries 

for(key, value) in martinData {
	
	print("key \(key) and vlaue \(value)")
}

for key in namesAndScore.keys{
	print("\(key)", terminator: " ")
}


//Sequence operations 

let namesString = namesAndScore.reduce(" ", combine: {$0 + "\($1.0)"})

namesString





