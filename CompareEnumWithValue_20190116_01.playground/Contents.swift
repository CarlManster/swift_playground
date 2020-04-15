import UIKit

struct Address: Equatable {
    var home: String?
    var work: String?
}

enum A: Equatable {
    case hello(Address?)
    case hi
}

let first: A = .hello(Address(home: "seoul", work: "busan"))
let second: A = .hello(Address(home: "seoul", work: "incheon"))
let third: A = .hello(Address(home: "seoul", work: "busan"))

print("first and second == \(first == second)")
print("first and third == \(first == third)")

