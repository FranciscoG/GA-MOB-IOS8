//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var name = "Francisco"
var GAClass = "iOS Development"

print("hello \(name), welcome to your \(GAClass) class")

// Data Types in Swift
// string
// dictionairy
// array
// int
// bool
// float
// double

var isTodayThurs : Bool

var age:Int
age = 50

if (age == 50) {
  print("You are 50 years old")
  print("You are old!")
} else {
  print("You are not 50 years old")
}

age = 95
name = "cisco"
if (age > 50 && name == "cisco") {
    print("You are over 50 years old")
} else if (age < 50) {
    print("You are under 50 years old")
} else {
    print("You are 50 years old")
}

if name != "arun" {
    print("\(name)")
}


// loop-di-loops

var someNums = [211,4,29,3,2,532,7,12]

for x in someNums {
    print(x)
}

someNums.first

var daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

var numOfDaysForward = 25;
daysOfWeek[numOfDaysForward%daysOfWeek.count]

// enumeration
// creating your own Data Type

enum CompassPoint {
    case North
    case South
    case East
    case West
}

CompassPoint.East
var smartHeading:CompassPoint
smartHeading = .North

UIColor.redColor()
UIColor.purpleColor()
UIColor(red: 0.9, green: 0.5, blue: 0.1, alpha: 1.0)
UIColor(red: 0.2, green: 1.0, blue: 0.7, alpha: 1.0)

var ranRed = CGFloat(arc4random_uniform(100))/100.0
var ranGreen = CGFloat(arc4random_uniform(100))/100.0
var ranBlue = CGFloat(arc4random_uniform(100))/100.0
UIColor(red: ranRed, green: ranGreen, blue: ranBlue, alpha: 1.0)

func getRanFloat(x:UInt32) -> CGFloat {
    let ranFloat = CGFloat(arc4random_uniform(x))/100.0
    return ranFloat
}
func getRanColor() -> UIColor {
    return UIColor(red: getRanFloat(100), green: getRanFloat(100), blue: getRanFloat(100), alpha: 1.0)
}
getRanColor()
getRanColor()
getRanColor()
getRanColor()














