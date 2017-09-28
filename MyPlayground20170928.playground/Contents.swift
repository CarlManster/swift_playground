//: Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"

// Check Palindrome
func checkPalindrome(inputString: String) -> Bool {
    let reversed = String(inputString.characters.reversed())
    
    return (inputString == reversed)
}

checkPalindrome(inputString: "AABBAA")

// Adjacent Elements Product
func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var result: [Int] = []
    
    for (index0, value0) in inputArray[0...(inputArray.count - 2)].enumerated() {
        let product = value0 * (inputArray[index0 + 1])
        
        result.append(product)
    }
    
    return result.max() ?? 0
}

adjacentElementsProduct(inputArray: [3, 6, -2, -5, 7, 3])

// Shape Area
func shapeArea(n: Int) -> Int {
    var result = 1
    
    if n > 1 {
        for i in (2...n) {
            result += 4 * (i-1)
        }
    }
    
    return result
}

shapeArea(n: 1)
shapeArea(n: 2)
shapeArea(n: 3)
shapeArea(n: 4)
shapeArea(n: 5)

// Make Array Consecutive
func makeArrayConsecutive2(statues: [Int]) -> Int {
    var result = 0
    
    if let min = statues.min(), let max = statues.max() {
        for i in (min...max) {
            if statues.contains(i) == false {
                result += 1
            }
        }
    }
    
    return result
}

makeArrayConsecutive2(statues: [6, 2, 3, 8])

// Almost Increasing Sequence
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    var result = false
    
    print("sequence == \(sequence)")
    
    if sequence.count > 2 {
        for (index, element) in sequence.enumerated() {
            
            
        }
    } else {
        result = true
    }
    
    return result
}

almostIncreasingSequence(sequence: [1, 2])                      // true
almostIncreasingSequence(sequence: [1, 3, 2, 1])                // false
almostIncreasingSequence(sequence: [1, 3, 2])                   // true
almostIncreasingSequence(sequence: [1, 2, 1, 2])                // false
almostIncreasingSequence(sequence: [1, 2, 2, 3, 4, 5, 6, 7])    // true
almostIncreasingSequence(sequence: [1, 2, 3, 4, 3, 6])          // true
almostIncreasingSequence(sequence: [3, 5, 67, 98, 3])           // true
almostIncreasingSequence(sequence: [10, 1, 2, 3, 4, 5])         // true
almostIncreasingSequence(sequence: [1, 2, 5, 3, 5])             // true



