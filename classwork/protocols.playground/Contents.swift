//: Playground - noun: a place where people can play

import UIKit


protocol SaysHello {
    func sayHello()
}

class Dog: SaysHello {
    func sayHello() {
        print("woof")
    }
    func blablabla(){
        print("test")
    }
}

class Person: SaysHello {
    func sayHello() {
        print("hi")
    }
}

func callSayHello(thing: SaysHello){
    thing.sayHello()
}

callSayHello(Dog())
callSayHello(Person())