//: Playground - noun: a place where people can play

import UIKit

let uintMax: UInt64 = UINT64_MAX
print(uintMax)

let ulonglong: CUnsignedLongLong = CUnsignedLongLong.max
print(ulonglong)

let decimalNumber1: NSDecimalNumber = NSDecimalNumber.maximum
print(decimalNumber1)

let decimalNumber2: NSDecimalNumber = NSDecimalNumber(value: 1111111111111111111)
print(decimalNumber2)

let decimalNumber3: NSDecimalNumber = decimalNumber1.adding(decimalNumber2)
print(decimalNumber3)

let isSame = decimalNumber1 == decimalNumber2
print(isSame)

let number: NSDecimalNumber = NSDecimalNumber(string: "120920980293410293081207023750928304981092834091235701928309480127017203948019283409712304182039480192701270350249801234")
print(number)



func make(_ number: Int) -> Int {
    return number
}

func make(_ string: String) -> Int {
    return Int(string) ?? 0
}

make(99)
make("100")

let num = 101
let binary = String(num, radix: 2)

var conpl = ""
for char in binary.characters {
    let noValue = Int(String(char)) ?? 0
    
    conpl.append("\(abs(1 - noValue))")
}

let result = Int(conpl, radix: 2)



func arrangeStringByWordLength(sentence: String) -> String {
    let lowercased = sentence.lowercased()
    let trimmed = lowercased.trimmingCharacters(in: CharacterSet(charactersIn: "."))
    let separated = trimmed.components(separatedBy: " ")
    let filtered = separated.filter{ $0.isEmpty == false }
    var sorted = filtered.sorted { $0.characters.count < $1.characters.count }
    
    if sorted.isEmpty == false {
        sorted[0] = sorted[0].capitalized
        
        return sorted.joined(separator: " ").appending(".")
    }
    
    return "."
}

//arrangeStringByWordLength(sentence: "The lines are printed in reverse order.")
//arrangeStringByWordLength(sentence: "The lines are printed in reverse order.")
//arrangeStringByWordLength(sentence: "Hell chic good nice best rank hacker.")
arrangeStringByWordLength(sentence: "Aa  ba ca d e fa  ga h i j.")
arrangeStringByWordLength(sentence: "Original.")
arrangeStringByWordLength(sentence: "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa .")
arrangeStringByWordLength(sentence: "Aa done a.")
arrangeStringByWordLength(sentence: "Hellow orld. hallo again.")

//arrangeStringByWordLength(sentence: "Cats and hats.")
//arrangeStringByWordLength(sentence: "Cats and  hats.")
//arrangeStringByWordLength(sentence: "Cats and   hats .")
//arrangeStringByWordLength(sentence: "Camelcased word.")
//arrangeStringByWordLength(sentence: "Camelcased or snakecased word capitalized complete.")








