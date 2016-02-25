//: Playground - noun: a place where people can play

import UIKit

var age: Int = 15

enum Rating {
  case Good, Bad, NotRated
}

var rating: Rating = .Good

class Car {
    var make : String
    var age : Int
    var rating : Rating?
    
    init(make: String, age: Int){
        self.make = make
        self.age = age
    }
    
    func isItAGoodCar() -> Bool {
        if rating == .Good {
          return true
        } else {
          return false
        }
    }
}

var forContour = Car(make: "Ford", age: 8)
var redJetta = Car(make: "VW", age: 0)

class Drive {
    var name : String = ""
    var primaryCar : Car? = nil
}

var currentTime = NSDate()
var timeFormatter = NSDateFormatter()
timeFormatter.timeStyle = .MediumStyle
timeFormatter.stringFromDate(currentTime)


