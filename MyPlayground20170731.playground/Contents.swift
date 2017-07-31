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

// flatmap
let flatNos = optNos.flatMap { $0 }
print(flatNos)

// filter
let filteredNos = flatNos.filter { (num) -> Bool in
    return (num % 3 < 2)
}
print(filteredNos)

// reduce
let reducedNos = filteredNos.reduce(0) { (last, item) -> Int in
    return last + item
}
print(reducedNos)


var tuples: [(String, Int)] = []
tuples.append(("hello", 9))
tuples.append(("world", 7))
tuples.append(("nice", 6))
tuples.append(("to", 3))
tuples.append(("meet", 0))
tuples.append(("you", 5))

let reducedTuple = tuples.reduce(("", 0)) { (last, item) -> (String, Int) in
    let appendedString = last.0.isEmpty ? item.0 : "\(last.0) \(item.0)"
    let appendedNumber = last.1 + item.1
    
    return (appendedString, appendedNumber)
}
print(reducedTuple)

