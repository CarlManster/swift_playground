//: Playground - noun: a place where people can play

import UIKit

let value: UInt8 = 127
let value2: Int8 = Int8(value)

let values: [Int] = [1,9,8,3,4,7,6,5]
let sorted = values.sorted { $0 > $1 }

print(sorted)
