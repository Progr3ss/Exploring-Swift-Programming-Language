//: Playground - noun: a place where people can play

import UIKit


//:Protocols 


// Implementing Protocols

protocol Vehicle{
	
	func accelerate()
	func  stop()
	
}

class Bike: Vehicle {
	
	var peddling: Bool = false
	var brakesApplied: Bool = false
	
	
	func accelerate()  {
		peddling = true
		brakesApplied = false
	}
	
	func stop(){
		peddling = false
		brakesApplied = true
	
	}
}
/* By  defining a protocol, you guarantee that any type that conforms to the protocol will have all teh members you've defined in the protocol*/


//implementing properties 

protocol WheeledVehicle: Vehicle {
	var numberOfWheels:Int {get}
	var wheelSize: Double{get set}
}

class Bike: WheeledVehicle {
	var numberOfWheels: Int{
		return 2
	}
}


private var myWheelSize: Double = 16.0
	var whelSize: Double{

get {
	return myWheelSize
}
set {
	myWheelSize = newValue
}

}

