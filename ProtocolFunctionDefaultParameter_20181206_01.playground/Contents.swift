import UIKit

protocol Planet {
    func village(with human: String, age: Int?)
}

struct Earth: Planet {
    func village(with human: String, age: Int? = nil) {
        print("human == \(human), age == \(age ?? 10)")
    }
}

let earth: Earth = Earth()
earth.village(with: "Karolina", age: 9)
earth.village(with: "Carl") // Good


let planet: Planet = Earth()
planet.village(with: "Jane", age: 11)
//planet.village(with: "Thomas") // Error: Missing Arguments

