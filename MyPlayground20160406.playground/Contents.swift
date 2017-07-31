//: Playground - noun: a place where people can play

import UIKit

extension String {
    mutating func appendString(str : String) {
        self = self + str
    }
}

var str1 = ""
var str2 = ""

var arr1 : [String] = ["hello", "world", "my", "name", "is", "carl", "manster", "choi" ]
var arr2 : [String:Int] = ["hello" : 1, "world" : 7, "my" : 8, "name" : 9, "is" : 0, "carl" : 5, "manster" : 3, "choi" : 2 ]

for val in arr1 {
    if let idx = arr1.indexOf(val) {
        str1.appendString("\(idx) == \(val)\n")
    }
}

for (key, value) in arr2 {
    str2.appendString("\(key) == \(value)\n")
}

print(str1)
print(str2)
