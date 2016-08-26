//: Playground - noun: a place where people can play

import UIKit
//import Darwin

/*
Strructures, which are a  "named typed". Like a String, In or Array, you can define your own structures to create named types to latter use in code.


Structures or structs, are one of the named types in Swift that allow you to encapsulate related properties and behaviors. you can define it, give it a name and then use it in code.


*/


// check potential customer in range 

let latitude: Double = 44.9871
let longitude: Double = -93.2758
let range: Double = 200.0


func isInRange(lat: Double, long: Double) -> Bool {
	
	
	let difference = sqrt(pow(latitude - lat, 2) + pow(longitude - long, 2))
	let distance = difference * 0.002
	
	
	return distance < range
}


isInRange(latitude, long: longitude)


//Refactor 
/* it clear that latitude and longitude are closely related close enought that you could think of them as a single value*/


struct Locaiton {
	let latitude: Double
	let longitude: Double
}




let pizzaLocaiotn = Locaiton(latitude: 44.9871, longitude: -93.2394)


struct DeliverRange {
	
	var range: Double
	var center: Locaiton
}


let storeLocaiton = Locaiton(latitude: 44.2323, longitude: -98.2342)



var pizzaRange = DeliverRange(range: 200, center: storeLocaiton)


print(pizzaRange)




//Mini-exercise 

struct pizzaOrder {
	
	var toppings : String?
	var size: Int?

}




//Acessing membeers 


pizzaRange.range
pizzaRange.center.latitude
pizzaRange.center.longitude


//Assign

pizzaRange.range = 300



//Mini-exercise 

func isRange2(lat:Double, long: Double) -> Bool {
	let difference = sqrt(pow(pizzaRange.center.latitude - lat, 2) + pow(pizzaRange.center.longitude - long, 2))
	let distance = difference * 0.002
	
	
	return distance < range
	
	
}


isRange2(latitude, long: longitude)



struct Location2 {
	let latitude: Double
	let longitude: Double
	
	//String in GPS format "44.9871, -93.2758"
	init(coordinateString: String) {
		let crdSplit = coordinateString.characters.split(",")
		latitude = atof(String(crdSplit.first!))
		longitude = atof(String(crdSplit.last!))
		

		
	}
	
}
var crdString = "12.12312, -14.233"
Location2(coordinateString: crdString)

let coord = Location2(coordinateString: crdString)

coord.latitude
coord.longitude

print(Location2.init(coordinateString: crdString))



struct Order {
	var toppings: [String]
	var size : String
	var crust : String
	
	
	init(toppings: [String], size: String, crust: String) {
		
		self.toppings = toppings
		self.size = size
		self.crust = crust
		
	}
	
	init(special: String){
		
		self.size = "Large"
		self.crust = "Regular"
		
		
		if special == "Veggie" {
			
			self.toppings = ["Tomatoes","Green Peppers", "Mushrooms"]
		}else if special == "Meat"{
			self.toppings = ["Sausage", "Pepperoni", "Ham","Bacon"]
		}else{
			self.toppings = ["Cheese"]
		}
	}
}


var order = Order(toppings: ["Veggie"], size: "Large", crust: "Regular")



//Introducing self 
// when youuse self in code, you're explicitly accessing the current value of the named type

//Initializer rule

struct ClimateControl {
	
	var temperature: Double
	var humidity: Double? // since humidity is optional the compiler will happily oblige
	
	init(temp: Double){
		temperature = temp
	}
	
	init(temp: Double, hum: Double){
		temperature = temp
		humidity = hum
	}
}

let echoMode = ClimateControl(temp: 87.0)
let dryMode = ClimateControl(temp: 90.0, hum: 30.0)

// a struct with default values
struct ClimateControl2 {
	var Temperature = 45.2
	var humidity: Double?
}


//Introducing Methods

let pizzaJoints = [
	DeliverRange(range: 200, center: Locaiton(latitude: 44.2323, longitude: -98.2342)),
	DeliverRange(range: 200, center: Locaiton(latitude: 44.2323, longitude: -98.2342))
]


func isInRange3(customer: Locaiton) -> Bool {

	for pizzaRange in pizzaJoints {
		let  difference = sqrt(pow(pizzaRange.center.latitude - customer.latitude
			, 2)) +
		pow(pizzaRange.center.longitude - customer.longitude, 2)
		
		if difference < pizzaRange.range {
			return true
		}
	}
	return false
}

let customer = Locaiton(latitude: 44.2322, longitude: -92.2323)

print(isInRange3(customer))




struct DeliveryRange {
	var range: Double
	let center: Locaiton
	
	
	func isInRange( customer : Locaiton) -> Bool {
		let difference = sqrt(pow(latitude - center.latitude, 2) + pow(longitude - center.longitude, 2))
		
		return difference < range
	}
}


let range4 = DeliveryRange(range: 150, center: Locaiton(latitude: 44.9871, longitude: -93.9323))


extension Locaiton {
	func isNorthernhemisphere() -> Bool {
		
		return latitude > 0.0
	}
}



let location = Locaiton(latitude: 34.3433, longitude: -94.23434)



// Structures as values 

/*
the term value has an important meaning when it comes to structs in swift, and that's because structs create what are known as value types 


a value type is an object or a piece of data that is copied on assignment, which means the assignment gets an exact  copy of he data rather than a erference to the value same data

*/




var a : Int = 5
var b : Int = a

print(a)
print(b)

a = 10
print(a)
print(b)




/*

Challenges A: Clothing your structs 


Create a T-shirt struct that has size, color and material options. provided methods to calculate the cost of a shirt based on its attributes

*/

  // Read http://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency

struct Tsize {
	let Small = "Samll"
	let Medium =  "Medium"
	let XLarge = "XLarge"
	let Large = "large"
	
}

struct Tmaterial{
	let cotton = "Cotton"
	let polyester = "Polyester"
	let Wool = "Wool"
}


struct TShirt {
	let size : String
	let color : String
	let materaial : String
	
	func cost() -> Double {
		
		let basePrice = 10.0
		let sizeMultiplier: Double
		
		let materialMultipler: Double

		
		switch size {
		case Tsize().Small, Tsize().Medium :
			sizeMultiplier = 1.0
		case Tsize().XLarge, Tsize().Large:
			sizeMultiplier = 1.1
		default:
			sizeMultiplier = 1.2
		}
		
	
		
		switch materaial {
		case Tmaterial().cotton:
			materialMultipler = 1.0
		case Tmaterial().polyester:
			materialMultipler = 1.1
		case Tmaterial().Wool:
			materialMultipler = 1.5
		default:
			materialMultipler = 2.0
		}
		
		
		return basePrice * sizeMultiplier * materialMultipler
	}
}


TShirt(size: Tsize().Medium, color: "Green", materaial: Tmaterial().cotton).cost()




