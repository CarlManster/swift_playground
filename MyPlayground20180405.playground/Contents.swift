//: Playground - noun: a place where people can play

import UIKit

enum Animal {
    case dog(type: String)
    case cat(type: String)
    case horse(type: String)
}

let animals: [Animal] = [.dog(type: "Growlithe"), .dog(type: "Rockruff"), .horse(type: "Gray")]

let hasCat = animals.contains { (animal) -> Bool in
    if case .cat = animal {
        return true
    }
    
    return false
}
