//: Playground - noun: a place where people can play

import UIKit

class WTF: Comparable, CustomDebugStringConvertible {
    let value: Int
    
    init(_ value: Int) {
        self.value = value
    }
    
    public static func <(lhs: WTF, rhs: WTF) -> Bool {
        return lhs.value < rhs.value
    }
    
    public static func <=(lhs: WTF, rhs: WTF) -> Bool {
        return lhs.value <= rhs.value
    }
    
    public static func >=(lhs: WTF, rhs: WTF) -> Bool {
        return lhs.value >= rhs.value
    }
    
    public static func >(lhs: WTF, rhs: WTF) -> Bool {
        return lhs.value > rhs.value
    }
    
    public static func ==(lhs: WTF, rhs: WTF) -> Bool {
        return lhs.value == rhs.value
    }
    
    public var debugDescription: String {
        return "\(self.value)"
    }
}

//let array = [2, 9, 6, 1, 3, 7, 5, 9]
let array = [WTF(2), WTF(9), WTF(6), WTF(1), WTF(3), WTF(7), WTF(5), WTF(9)]
print(array)

let sortedArray0 = array.sorted() // ascending
print(sortedArray0)

let sortedArray1 = array.sorted { $0 < $1 } // ascending
print(sortedArray1)

let sortedArray2 = array.sorted { $0 > $1 } // descending
print(sortedArray2)

let sortedArray3 = array.sorted().reversed().map { $0 } // descending
print(sortedArray3)

