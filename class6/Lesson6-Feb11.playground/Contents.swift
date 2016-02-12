//: Playground - noun: a place where people can play

import UIKit

var name = "bob"
var age = 40
var dictionairy = [name:age]

var favPet : String? = "wally"
favPet = ""
favPet = nil
// the ? mark sets it to declared type or nil

var a : String?
print(a)

/**************************************************/

var newFavPet : String? = "Buster the dog"
print(newFavPet)
print(newFavPet!)
// the ! "unwraps" the variable from the Optional

newFavPet = nil
if (newFavPet == nil) {
    print("it's nill")
} else {
    print(newFavPet!)
}

/**************************************************/

var newerPet : String? = "Something the cat"

if newerPet?.containsString("cat") == true {
    print("cat lover")
} else {
    print("dog lover")
}


