//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var tempArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]

let finalArray = tempArray.filter { ["B", "D", "F", "I"].contains($0) }

tempArray
finalArray


var tempArray2 = ["a", 1, "B", 2]

let finalArray2 = tempArray2.filter { !($0 is Int) }

finalArray2