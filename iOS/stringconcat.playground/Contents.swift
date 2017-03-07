////: Playground - noun: a place where people can play

import UIKit
//
////var str = "Hello, playground"
//
//
//var errorStr = "single quotes do not work"
//
//print("yea")
//
//var potentialOverflow = Int16.max
//
//
////var unsignedOverflow = UInt8.max
//// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
////unsignedOverflow = unsignedOverflow &+ 1
//
//var unsignedOverflow = UInt8.min
//// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
//unsignedOverflow = unsignedOverflow &- 1
//
//var signedOverflow = Int8.max
//signedOverflow = signedOverflow &- 1
//
//
//
//var str: String = "This is a String"
//
//var num: Int = -42
//
//var dec: Double = 4.2
//
//
////let name: String = "Anakin Skywalker"
//
//var myMutableString = "change me"
//let myImmutableString = "can't change"
//
//myMutableString += "!"
//
//
//var myMutableArray = ["one"]
//
//let myImmutableArray = ["uno"]
//
//myMutableArray.append("two")
//
//myMutableArray + ["three", "four"]
//
//var myMutableDictionary = ["one":1]
//
//let myImmutableDictionary = ["uno":1]
//
//myMutableDictionary["two"] = 2
//myMutableDictionary["one"] = 0
//myMutableDictionary["three"] = 3
//
//
//
//var rings = 5
//var numOfAllStarAppearances = 7
//if rings >= 5 || numOfAllStarAppearances > 3 {
//    print("Welcome you are truly a legend")
//}
//
//var crazy = false
//if !crazy {
//    print("Lets Party!")
//}
//
//print("The maximum value \(Int.max)")
//print("The mininum value \(Int.min)")
//
//print("The maximum value \(Int32.max)")
//print("The minimum value \(Int32.min)")
//
//print("the maximum value \(UInt32.max)")
//print("The minimum value \(UInt32.min)")
//
//var myInt32: Int32 = 3
//var myNormalInt: Int = 2
//
//myNormalInt = Int(myInt32)
//
//var myDouble = 3.2
//var myFloat: Float
//
//myFloat = Float(myDouble)
//
//print("Addition \(1+3)")
//print("Subtration \(1-3)")
//print("Multiplication \(1*3)")
//print("Division \(1/3)")
//
//for i in 1...255 {
//    print(i)
//}
//
//for i in 1...100 {
//    if i % 3 == 0 && i % 5 == 0 {
//        continue
//    }
//    else if i % 3 == 0 || i % 5 == 0 {
//        print(i)
//        }
//    }
//
//for i in 1...100 {
//    if i % 3 == 0 && i % 5 == 0 {
//        print("FizzBuzz")
//    }
//    else if i % 3 == 0 {
//        print("Fizz")
//    }
//    else if i % 5 == 0 {
//        print("Buzz")
//    }
//}
//
//var toDoList: [String] = [String]()
//toDoList.append("Learn iOS")
//toDoList.append("Build the next flappy bird")
//toDoList.append("Retire in Cancun")
//print(toDoList)
//
//var arrayOfInts = [1, 2, 3, 4, 5]
//print("\(arrayOfInts[0])")
//print("\(arrayOfInts[1])")
//print("\(arrayOfInts[2])")
//print("\(arrayOfInts[3])")
//print("\(arrayOfInts[4])")
//
//print("\(arrayOfInts[0...1])")
//print("\(arrayOfInts[1..<4])")
//print("\(arrayOfInts[2...3])")
//arrayOfInts[0] = 9
//print(arrayOfInts)
//
//var nums = [1,2,3,4]
//nums.append(5)
//print(nums)
//
//var moreInts = [1,2,3,4,5]
//var popped = moreInts.remove(at:0)
//print(popped)
//print(moreInts)
//
//var intList = [1,2,3,4,5]
//intList.insert(6, at:5)
//print(intList)
//
//var countList = [1,2,3,4,5]
//countList.insert(7, at:countList.count)
//print(countList)
//
//var starters = ["Fisher", "Kobe", "Gasol", "Bynum", "World Peace"]
//for starter in starters {
//    print(starter)
//}
//for i in 0..<starters.count {
//    print(starters[i])
//}
//
//var array: [UInt32]=[]
//for i in 1...255{
//    array.append(UInt32(i))
//}
//
////print(array)
//
//
//var dice1 : UInt32 = 0
//var dice2 : UInt32 = 0
//
//dice1 = arc4random_uniform(255) + 1;
//let someInt :Int = Int(dice1)
//dice2 = arc4random_uniform(255) + 1;
//let someInt2 :Int = Int(dice2)
//print(array[someInt])
//print(array[someInt2])
//
//if array[someInt] != array[someInt2] {
//    swap(&array[someInt], &array[someInt2])
//}
//print(array)
//
//var length = array.count
//
//for i in 1...100 {
//    var randNumberOne = Int(arc4random_uniform(UInt32(length)))
//    var randNumberTwo = Int(arc4random_uniform(UInt32(length)))
//    
//    if randNumberOne != randNumberTwo {
//        swap(&array[randNumberOne], &array[randNumberTwo])
//    }
//    
//}
//
//for i in 0..<array.count {
//    
//    if(array[i] == 45){
//        
//        array.remove(at: i)
//        
//        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
//        
//        break
//    }
//    
//}
//
//var name:String = "Jay"
////var pet: String?
//
//
//
//var xFactor: String?
//xFactor = "charisma"
//print(xFactor)
//
//var present: String? = "Apple Watch"
//
//if let unwrappedPresent = present {
//    print("OMG THANK YOU FOR THE \(unwrappedPresent)")
//}
//
//print("OMG THANK YOU FOR THE \(present!)")
//
//var present2: String! = "PS4"
//print("\(present2)")
//present2 = nil
//print("\(present2)")

//var myDict = [String: Int]()
////
//var dictionary = [
//        "Kobe": 24,
//        "Lebron":23,
//        "Rando":9
//]
//
//print(dictionary)
//dictionary["Fisher"] = 2
//print(dictionary)
//dictionary["Kobe"] = 8
//print(dictionary)
//
//dictionary["Kobe"]
//
//if let jerseyNumber = dictionary["Kobe"] {
//    print(jerseyNumber)
//}
//
////dictionary["Lebron"] = nil
//print(dictionary)
//
//var lebronsNumber = dictionary.removeValue(forKey: "Lebron")
//print(lebronsNumber)
//
//for (key, value) in dictionary {
//    print("The key is \(key) and the value is \(value)")
//}
//
//for x in dictionary {
//    print(x)
//}
//
//let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
//let cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
//var deckOfCards = [String: [Int]]()
//for i in 0..<suits.count{
//    deckOfCards[suits[i]] = cards}
//print(deckOfCards)
//
//func sayHello() {
//    print("Hello how are you doing today?")
//}
//
//sayHello()
//
//func sayHello2(name: String) {
//    print("Hello, \(name), how are you doing?")
//}
//sayHello2(name: "Jackie")
//
//func printDescriptionWithWidth(w:Int, andHeight h:Int) {
//    print("My width is \(w) and my height is \(h)")
//}
//
//printDescriptionWithWidth(w: 10, andHeight: 20)

//var myInt = 1
//func changeMyInt(someInt:Int) {
//    var someInt = someInt
//    someInt = someInt + 1
//    print(someInt)
//}
//
//changeMyInt(someInt:myInt)
//print(myInt)

//var myInt = 1
//func changeMyInt(someInt: inout Int) {
//    someInt = someInt + 1
//    print(someInt)
//}
//changeMyInt(someInt: &myInt)
//print(myInt)
//
//func sayHello3(name:String = "buddy") {
//    print("Hey \(name)")
//}
//
//sayHello3()
//sayHello3(name: "Yoda")
//
//func sayHello4(name:String = "buddy") -> String {
//    return "Hey \(name)"
//}
//var greeting: String?
//greeting = sayHello4(name:"Luke")
//print(greeting!)
//
//
//func calculateAreaOfRectangleWithWidth(w:Int, andHeight h :Int) -> Int {
//    return w * h
//}
//var area = calculateAreaOfRectangleWithWidth(w: 10, andHeight: 3)
//print(area)

//func lookForSomethingIn(dictionary: [String:Int], forKey key: String) -> Int? {
//    if let value = dictionary[key] {
//        return value
//    }
//    else {
//        return nil
//    }
//}
//
//var jerseyNumber = lookForSomethingIn(dictionary: dictionary, forKey: "Kobe")
//if let num = jerseyNumber {
//    print(num)
//}
//
//func findMinOf(arr:[Int]) -> Int? {
//    if arr.count > 0 {
//        var min = arr[0]
//        for num in arr {
//            if num < min {
//                min = num
//            }
//        }
//        return min
//    }
//    else {
//        return nil
//    }
//}
//
//func tossCoin() -> String {
//    let coin = Int(arc4random_uniform((2)))
//    if coin == 0 {
//        return "Heads"
//    }
//    else {
//        return "Tails"
//    }
//}
//tossCoin()
//
//func tossMultipleCoins(tosses:Int) -> Double {
//    var headsCount = 0
//    var tailsCount = 0
//    for _ in 1..<tosses {
//        if tossCoin() == "Heads" {
//            headsCount += 1
//        }
//        else {
//            tailsCount += 1
//        }
//    }
//    return Double(tosses)/Double(headsCount)
//}
//tossMultipleCoins(tosses: 10)

//class Person {
//    var species = "H.Sapiens"
//}
//
//var myPerson: Person = Person()
//print("\(myPerson.species)")
//class Person {
//    let species = "H. Sapiens"
//}
//
//var myPerson = Person()
//myPerson.species = "H. Erectus"
//print("\(myPerson.species)")

//class Person {
//    var species = "H. Sapiens"
//    func speak(){
//        print("Hello I am a \(self.species)")
//    }
//}
//var myPerson:Person = Person()
//myPerson.speak()


//class User {
//    var intelligence = 0
//    func studyForTopic(topic:String, hours: Int) {
//        print("I am studying \(topic) for \(hours) hours")
//    }
//}
//
//var user = User()
//user.studyForTopic(topic: "Math", hours: 3)
//
//
//class Person {
//    var species = "H.Sapien"
//    var name : String
//    init(name: String) {
//        self.name = name
//    }
//    func speak() {
//        print("Hello! I am a \(self.species) and my name is \(self.name)")
//    }
//}
//var myPerson: Person = Person(name:"Jay")
//myPerson.speak()
//
//struct Rectangle {
//    var width = 10
//    var height = 20
//}
//
//var myRectangle = Rectangle()
//print("\(myRectangle.width)")
//
//struct Rectangle2 {
//    var width = 10
//    var height = 20
//    func printDesc() {
//        print("I have a width of \(width) and a height of \(height)")
//    }
//    mutating func doubleWidth()
//    {
//        width *= 2
//    }
//}
//struct Rectangle3 {
//    var width: Int
//    var height: Int
//}
//let rectangle = Rectangle3(width: 20, height:30)

//class Person {
//    var fullName: String
//    init(name:String) {
//        self.fullName = name
//    }
//    func introduce() {
//        print("Hi my name is \(self.fullName)")
//    }
//}
//
//var j = Person(name:"Jackie Thind")
//var k = j
//
//j.introduce()
//k.fullName = "Jackie S Thind"
//j.introduce()
//
//struct Rectangle {
//    var width: Int
//    var height: Int
//}
//var square1 = Rectangle(width:10, height:10)
//var square2 = square1
//
//print("square1's width: \(square1.width), square2's width: \(square2.width)")
//
//square2.width = 20
//square2.height = 20
//
//print("square1's width: \(square1.width), square2's width: \(square2.width)")
//
//
//struct Card {
//    var value: String
//    var suit: String
//    var numerical_value: Int
//    func show() {
//        print(value, "of", suit, ":value", numerical_value)
//    }
//}
//
//class Deck {
//    var cards = [Card]()
//    
//    init() {
//        self.reset()
//    }
//    func deal() -> Card? {
//        if self.cards.count > 0 {
//            return self.cards.remove(at:0)
//        }
//        else {
//            return nil
//        }
//    }
//    func reset(){
//        let values = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
//        let suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
//        self.cards = [Card]()
//        for suit in suits {
//            for i in 0...12 {
//               let newCard = Card(value: values[i], suit: suit,  numerical_value: i+1)
//                self.cards.append(newCard)
//            }
//        }
//    }
//    func shuffle(){
//        for i in stride(from: self.cards.count-1, to: 0, by: -1) {
//            let swapCardIndex = Int(arc4random_uniform(UInt32(i)))
//            let temp = self.cards[i]
//            self.cards[i] = self.cards[swapCardIndex]
//            self.cards[swapCardIndex] = temp
//        }
//    }
//    
//    func show(){
//        for card in self.cards {
//            card.show()
//        }
//    }
//    
//}
//
//class Player {
//    var name: String
//    var hand: [Card]
//    
//    init(name:String){
//        self.name = name
//        self.hand = [Card]()
//    }
//    
//    func draw(deck:Deck) -> Card? {
//        if let drawnCard = deck.deal() {
//            self.hand.append(drawnCard)
//            return drawnCard
//        }
//        else {
//            return nil
//        }
//    }
//    func discard(suit:String, value:String) -> Bool {
//        for i in 0...self.hand.count-1 {
//            if (self.hand[i].suit == suit && self.hand[i].value == value) {
//                self.hand.remove(at:i)
//                return true
//            }
//        }
//            return false
//    }
//    func show(){
//        for card in self.hand {
//            card.show()
//        }
//    }
//}
//let newDeck = Deck()
//
//print("<<<<<<<<<<<<<<<<<<<<< New deck was made >>>>>>>>>>>>>>>")
//
//newDeck.show()
//
//newDeck.shuffle()
//
//print("<<<<<<<<<<<<<<<<<<<<< New deck was shuffled >>>>>>>>>>>>>>>")
//
//newDeck.show()
//
//let jackie = Player(name: "Jackie")
//
//jackie.draw(deck:newDeck)
//jackie.draw(deck:newDeck)
//jackie.draw(deck:newDeck)
//jackie.draw(deck:newDeck)
//jackie.draw(deck:newDeck)
//jackie.draw(deck:newDeck)
//
//print("<<<<<<<<<<<<<<<<<<<<< Jackie's hand >>>>>>>>>>>>>>>")
//jackie.show()
//
//print("<<<<<<<<<<<<<<<<<<<<< Jackie's discard >>>>>>>>>>>>>>>")
//print(jackie.discard(suit: "Clubs", value: "Ace"))
//
//
//
//
class Person {
    var species = "H.Sapiens"
    var name = String()
    init(name: String) {
        self.name = name
    }
    func speak() {
        print("hello, i am a \(self.species) and my name is \(self.name)")
        
    }
}

class Developer: Person {
    var favoriteLanguage: String
    init(name: String, favoriteLanguage: String) {
        self.favoriteLanguage = favoriteLanguage
        super.init(name:name)
    }
    override func speak() {
        print("Hello! I am a Developer! My name is \(self.name)")
    }
}

var myDeveloper: Developer = Developer(name: "Jackie", favoriteLanguage: "Swift")
myDeveloper.speak()

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

