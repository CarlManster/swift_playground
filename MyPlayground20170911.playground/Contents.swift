//: Playground - noun: a place where people can play

import UIKit

extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        
        return strongSelf.isEmpty ? nil : strongSelf
    }
}

var str0: String? = "Hello, playground"
var str1: String? = nil
var str2: String? = ""

let array = [ str0, str1, str2 ]
let arrayMap = array.map { $0.nilIfEmpty }
let arrayFlatMap = array.flatMap { $0.nilIfEmpty }

print(array)
print(arrayMap)
print(arrayFlatMap)

