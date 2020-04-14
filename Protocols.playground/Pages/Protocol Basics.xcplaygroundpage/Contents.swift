

// Ian French, April 13 2020
import Foundation

//: # Protocols
//: Protocols are, as per Apple's definition in the _Swift Programming Language_ book:
//:
//: "... a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol."
//:
//: The below example shows a protocol that requires conforming types have a particular property defined.



//: Protocols can also require that conforming types implement certain methods.



//: Using built-in Protocols



//: ## Protocols as Types


protocol GeneratesRandomNumbers {
    func random() -> Int
}

class  OneThroughTen: GeneratesRandomNumbers {
    func random() -> Int {
        return Int.random(in: 1...10)
    }
}

class Dice {
    let sides: Int
    let generator: GeneratesRandomNumbers
    
    init(sides: Int, generator: GeneratesRandomNumbers){
    self.sides = sides
    self.generator = generator
    }

func roll() -> Int {
    return Int(generator.random() % sides) +  1
  
   }
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
