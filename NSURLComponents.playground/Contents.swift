//: Playground - noun: a place where people can play

import UIKit

let components = NSURLComponents()

components.scheme = "https"
components.host = "udacity.com"
components.path = "/nanodegree"
components.queryItems = [NSURLQueryItem]()

let queryItem1 = NSURLQueryItem(name:"method", value: "flickr.photos.search")
let queryItem2 = NSURLQueryItem(name:"api_key", value: "123")
let queryItem3 = NSURLQueryItem(name:"method", value: "purple")

components.queryItems?.append(queryItem1)
components.queryItems?.append(queryItem2)
components.queryItems?.append(queryItem3)
print(components.URL!)

//Learn more http://nshipster.com/nsurl/