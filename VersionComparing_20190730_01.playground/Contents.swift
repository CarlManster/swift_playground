import UIKit

extension ComparisonResult: CustomStringConvertible {
    public var description: String {
        switch self {
        case .orderedSame:
            return "="
        case .orderedAscending:
            return "<"
        case .orderedDescending:
            return ">"
        }
    }
}

func comp(_ first: String, _ second: String) {
    let compResult = first.compare(second, options: .numeric)
    
    print("\(first)\t\(compResult)\t\(second)")
}

let v1 = "1.0"
let v2 = "1.0.0"
let v3 = "1.9.0"
let v4 = "1.10.0"
let v5 = "1.9.9"
let v6 = "1.99"
let v7 = "1.1.0"
let v8 = "1.1000.0"
let v9 = "1.0.10"

comp(v1, v2)
comp(v3, v4)
comp(v5, v6)
comp(v7, v4)
comp(v4, v8)
comp(v7, v7)
comp(v4, v9)
