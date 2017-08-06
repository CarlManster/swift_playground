//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let testClosure1 = {
    return Date()
}

let testClosure2: (() -> Date) -> TimeInterval = { (closure: () -> Date) in
    let date = closure()
    return date.timeIntervalSince1970
}

let testClosure3 = { (timeInterval: TimeInterval) in
    return Int(timeInterval)
}

let testClosure4 = { (x: Int, y: Int) in
    return x + y
}

let result = testClosure4(testClosure3(testClosure2(testClosure1)), 3)

