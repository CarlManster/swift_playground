//: Playground - noun: a place where people can play

import UIKit

var sub0 = ["Hello", "playground"]
var sub1 = ["Good", "Evil"]
var sub2 = ["Hi", "Bye"]
var sub3 = ["Holy", "Unholy"]
var sub4 = ["Great", "Worst"]

var array = [sub0, sub1, sub2, sub3, sub4]

print(array)

for (index, var sub) in array.enumerated() {
    for (subIndex, final) in sub.enumerated() {
        if final.hasPrefix("G") {
            print(final)
            
            let processed = final.replacingOccurrences(of: "G", with: "F")
            sub[subIndex] = processed
        }
    }
    
    array[index] = sub
}

print(array)
