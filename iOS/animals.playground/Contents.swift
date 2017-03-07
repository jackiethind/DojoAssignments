//: Playground - noun: a place where people can play

import UIKit

class Animal {
    var name = String ()
    var health = 100
    init(name: String) {
        self.name = name
    }
    func displayHealth() {
        print("I am a \(name) and my health is \(health)")
    }
}

class Cat: Animal {
    
    init(catName: String) {
        super.init(name:catName)
        self.health = 150
    }
    
    func growl() {
        print("Rawr")
    }
    func run() {
        if self.health >= 10{
            print("Running")
            self.health -= 10
        }
    }
}

class Lion: Cat {
    init(lionName:String) {
        super.init(catName:lionName)
        self.health = 200
    }
    override func growl() {
        print("ROAR!!!! I am the king of the Jungle")
    }
    
}
class Cheetah: Cat {
    init(cheetahName:String) {
        super.init(catName:cheetahName)
    }
    override func run() {
        if self.health >= 50 {
            print("Running faster!")
            self.health -= 50
        }
        
    }
    func sleep(){
        if self.health + 50 <= 200 {
            self.health += 50
            print("Cheetah needs its sleep")
        }
    }
}

var myAnimal = Animal(name: "Gorilla")

myAnimal.displayHealth()

var myCat: Cat = Cat(catName: "Cat")
var myLion: Lion = Lion(lionName: "Simba")
var myCheetah: Cheetah = Cheetah(cheetahName: "Swifty")
myCat.displayHealth()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.run()
myCat.displayHealth()
myLion.run()
myLion.run()
myLion.run()
myLion.growl()
myCheetah.run()
myCheetah.run()
myCheetah.run()
myCheetah.run()
myCheetah.displayHealth()


