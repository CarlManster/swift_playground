import UIKit

var anyOpts: [Any?] = ["hello,", "indiana jones.", "this", "is", 1]

let result = anyOpts.compactMap { $0 }.map { "\($0)" }.joined(separator: " ")

print("result == \(result).")
