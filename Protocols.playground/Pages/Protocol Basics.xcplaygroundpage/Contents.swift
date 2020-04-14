

// Ian French, April 13 2020
import Foundation

//: # Protocols
//: Protocols are, as per Apple's definition in the _Swift Programming Language_ book:
//:
//: "... a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol."
//:
//: The below example shows a protocol that requires conforming types have a particular property defined.

protocol FullyNamed {
    var fullName: String { get }
}

// adoption  and conformance

// get and set  = read access and write acccess

struct Person: FullyNamed {
    var fullName: String
    
}

class StarShip: FullyNamed {
   
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix

    }
    
    // computed property
    var fullName: String {
        
        return (prefix != nil ? prefix! + " ": "") + self.name
    }
    
}

var ncc1701 = StarShip(name: "Enterprise", prefix: "USS")

var firefly = StarShip(name: "Serenity")

print(ncc1701.fullName)

print(firefly.fullName)







//: Protocols can also require that conforming types implement certain methods.




protocol GeneratesRandomNumbers {
    func random() -> Int
}

class  OneThroughTen: GeneratesRandomNumbers {
    func random() -> Int {
        return Int.random(in: 1...10)
    }
}
let rand = OneThroughTen()
print (rand.random())


//: Using built-in Protocols
extension StarShip: Equatable {
    static func == (lhs: StarShip, rhs: StarShip) -> Bool {
        if lhs.fullName == rhs.fullName { return true }
        else {return false }
        }
   
}
    if ncc1701 == firefly {
    print("Same Starship")
    }



//: ## Protocols as Types









class Dice {
    let sides: Int
    let generator: GeneratesRandomNumbers
    
    init(sides: Int, generator: GeneratesRandomNumbers){
    self.sides = sides
    self.generator = generator
    }

func roll() -> Int {
    return Int(generator.random() % sides) +  1
  
    
     // e.g. say dice has 6 sides, random gives 10  so 10 % 6 = 4 + 1 = 5
     // 1 % 6  =   5  + 1 = 6    review mods   3 % 6 = 3 + 1 = 4   etc.
   }
}

var d6 = Dice(sides: 6, generator: OneThroughTen())
for _ in 1...5 {
    print (d6.roll())
}




protocol DiceGame {
    var dice: Dice { get }
    func play()
}
class Player {
    var id: Int
    var score: Int
    var knockOutNumber: Int
    var knockedOut: Bool

    init (id: Int) {
        self.id = id
        self.knockOutNumber = Int.random (in: 6...9)
        self.score = 0
        self.knockedOut = false
    }
}
