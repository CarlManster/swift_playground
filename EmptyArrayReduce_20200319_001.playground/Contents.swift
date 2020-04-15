import Cocoa

let origin: [Int] = []

let result = origin.reduce(100) { $0 + $1 }

print("result == \(result)")
