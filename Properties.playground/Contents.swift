//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//:Properties

struct Car{
	let make: String
	let color: String
}

struct Contact{
	var fullName: String
	var emailAddress: String
}

var person = Contact(fullName: "martin chibwe", emailAddress: "mchibwe01@gmail.com")

//access 
let name = person.fullName
let email = person.emailAddress
//assign values
person.fullName = " MC"


//Default values
enum Type {
	case Work, Family, Friend
}
struct Contacts {
	var fullName: String
	let emailAddress: String
	var type: Type = .Friend
}

//Computed properties

struct TV {
	var height: Double
	var width: Double
	
	//1 
	var diagonal: Int{
		//2
		let aSquared = pow(height, 2)
		let bSquared = pow(width, 2)
		let cSquared = aSquared + bSquared
		
		//3
		let c = sqrt(cSquared)
		//4
		let rounded = round(c)
		//5
		return Int(rounded)
	}
}


var tv = TV(height: 53.93, width: 95.83)
let size = tv.diagonal

tv.width = 53.93
let diagonal = tv.diagonal


//getter and setters

struct TV2 {
	var height: Double
	var width: Double
	
	//1
	var diagonal2: Int{
		
		get{
			return Int(round(sqrt(height * height + width * width)))
		}
		set {
			let rationwidth: Double = 16
			let ratioHeight: Double = 9
			
			//4
			height = Double(newValue) * ratioHeight /
			sqrt(rationwidth * rationwidth + ratioHeight * ratioHeight)
			width = height * ratioHeight / ratioHeight
		}

	}
}

//Singleton pattern 

/*Singleton is a special case object where you have a defined class, but you only want a single instance of the class to exit at one time */


//One way to produce a singleton in swift is by using a constant type property, static let:


class GameManager{
	
	//1
	static let defaultManager = GameManager()
	var gameScore = 0
	var saveState = 0
	//2
	private init() {}

	
}

//1 A constant type property has the default value of a vew instance of GameManager 
//2 the private  must be a true singleton. A private initializeder ensuers that the class gets initizer ensueres that the class gets initialized only once.



//:Property Observers

/*willSet{} and didSet{} similar to the way you used set {} and get {}*/



struct Level {
	static var highestLevel = 1
	
	let id : Int
	var boss: String
	var unlocked: Bool {
		
		didSet {
			if unlocked && id > Level.highestLevel {
				Level.highestLevel = id
			}
		}
	}
}
//willSet and didSet  are not called when a property is set during initialization

class LightBulb{
	
	static let maxCurrent = 40
	var currentCurrent  = 0  {
	
		didSet {
			if currentCurrent > LightBulb.maxCurrent {
				print("Current too high, falling back to previous setting")
				currentCurrent = oldValue
			}
		}
	}
}



var light = LightBulb()
light.currentCurrent = 50
var current = light.currentCurrent
light.currentCurrent = 40
current = light.currentCurrent

//Lazy Propertties 

/*IIF you have a property that might take some time to calculate, you don't want to show things down until you actually neeed the property, */



class Circle {
	
	lazy var pi = {
		return ((4.0 * atan(1.0 / 5.0 )) - atan(1.0 / 239.0 )) * 4.0
	}()
	
	var radius: Double = 0
	var circumference: Double {
		return pi * radius * 2
	}
	
	
	init (radius: Double ){
		self.radius = radius
	}

}

let circle = Circle(radius: 5)
let circumference = circle.circumference

//using lazy 
class IceCream {
	
	let name = "Martin"
	lazy var ingredients: [String] = { return ["Sugar", "Milk"]}()
	
	init(){
		
	}
}

let ice = IceCream()
ice.ingredients.append("Manago")
