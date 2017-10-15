//: Playground - noun: a place where people can play

import UIKit

// Question 1: Merge Strings
var sample0 = "12345678901234"
var sample1 = "abcdefghi"

func mergeStrings(a: String, b: String) -> String {
    var result = ""
    
    let lengthA = a.characters.count
    let lengthB = b.characters.count
    
    for chars in zip(a.characters, b.characters) {
        result.append("\(chars.0)\(chars.1)")
    }
    
    var subString: String?
    
    if lengthA > lengthB {
        subString = String(a[b.endIndex..<a.endIndex])
    } else if lengthB > lengthA {
        subString = String(b[a.endIndex..<b.endIndex])
    }
    
    result.append(subString ?? "")
    
    return result
}

let result = mergeStrings(a: sample0, b: sample1)
print("mergeStrings result == \(result)")


// Question 3: Build the Subsequences
func buildSubsequences(s: String) -> [String] {
    var result: [String] = []
    
    let strLength = s.characters.count
    let totalCount = Int(NSDecimalNumber(decimal: pow(2, strLength)))
    
    if strLength > 0 {
        for sequence in 1..<totalCount {
            var binary = String(sequence, radix: 2)
            var value = ""
            
            if strLength - binary.characters.count > 0 {
                for _ in 0..<(strLength - binary.characters.count) {
                    binary = "0\(binary)"
                }
            }
            
            for char in zip(s.characters, binary.characters) {
                if char.1 == "1" {
                    value.append(char.0)
                }
            }
            
            result.append(value)
        }
    }
    
    return result.sorted()
}

let sample2 = "ba"
let sample3 = "abc"

let result2 = buildSubsequences(s: sample2)
let result3 = buildSubsequences(s: sample3)
print("buildSubsequences result2 == \(result2)")
print("buildSubsequences result3 == \(result3)")



