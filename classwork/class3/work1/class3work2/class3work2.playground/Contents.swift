import UIKit


func sayHello(name: String) {
    print( "hello " + name )
}

sayHello("Francisco")


var daysInWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

let numOfDaysInWeek = daysInWeek.count

for day in daysInWeek {
    print("today is \(day)");
}

daysInWeek.forEach(sayHello)
