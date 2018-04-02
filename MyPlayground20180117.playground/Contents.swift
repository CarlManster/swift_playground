//: Playground - noun: a place where people can play

import UIKit

let count = 10

for x in (0...count).reversed() {
    print("\(x)")
}

let idx1 = IndexPath(row: 1, section: 0)
let idx2 = IndexPath(row: 1, section: 0)
let idx3 = IndexPath(row: 2, section: 0)
let idx4 = IndexPath(row: 3, section: 1)
let idx5 = IndexPath(row: 3, section: 1)

print("1&2 == \(idx1 == idx2)")
print("1&3 == \(idx1 == idx3)")
print("1&4 == \(idx1 == idx4)")
print("1&5 == \(idx1 == idx5)")
print("4&5 == \(idx4 == idx5)")



