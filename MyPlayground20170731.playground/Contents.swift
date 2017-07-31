//: Playground - noun: a place where people can play

import UIKit

// map
let numbers = [1,2,3]
let doubled = numbers.map { $0 * 2 }
print(doubled)

// map with optional
let optNumbers = [1,2,nil,4,5,nil,7]
let optDoubled = optNumbers.map { (num) -> Int in
    if let num = num {
        return num * 3
    }
    
    return 0
}
print(optDoubled)

// enumerated map with optional
let optNos = [1,2,3,4,5,nil,nil,8,9]
let optDbs = optNos.enumerated().map { (index, no) -> Int in
    if let no = no {
        return no * 7
    }
    
    return (index + 1) * 7
}
print(optDbs)
