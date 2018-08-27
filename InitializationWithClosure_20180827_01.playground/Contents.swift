//: Playground - noun: a place where people can play

import UIKit

struct Hello {
    var first: Int?
    var second: String?
    var third: Date?
    
    init(_ closure: (inout Hello) -> Void) {
        closure(&self)
    }
}


let sample = Hello { (origin) in
    origin.first = 10
    origin.second = "World"
}

print("sample == \(sample.first ?? -1), \(sample.second ?? "error"), \(sample.third ?? Date(timeIntervalSince1970: -1))")

//sample.first = 20 // Error
