//: Playground - noun: a place where people can play

import UIKit

// UserDefaults
var test: [String] {
    get {
        if let result = UserDefaults.standard.array(forKey: "Test") as? [String] {
            return result
        }
        
        return []
    }
    set {
        print("newValue == \(newValue)")
        
        UserDefaults.standard.set(newValue, forKey: "Test")
    }
}


test.append("Hello")
test.append("world")
test.append("good")
test.append("nice")

print("\(test as AnyObject)")

test.removeAll()

// reduce
var array = [1,2,3,4,5,6,7,8,9]

var result: [Int] = array.reduce([]) { (oldValue, value) -> [Int] in
    let newElement: Int
    if let last = oldValue.last {
        newElement = last + value
    } else {
        newElement = value
    }
    
    var newValue = oldValue
    newValue.append(newElement)
    return newValue
}

// fibonacci
func fibonacci(count: UInt) -> [NSDecimalNumber] {
    var result: [NSDecimalNumber] = [0, 1]

    (0..<count).forEach { (value) in
        result.append(Array(result.suffix(2)).reduce(0, { (last, value) -> NSDecimalNumber in return last.adding(value) }))
    }

    return result
}

let values = fibonacci(count: 380)

print("fibonacci == \(values as AnyObject)")
