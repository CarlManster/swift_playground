//: Playground - noun: a place where people can play

import UIKit

struct StructA: Decodable {
    var hello: String
    
    enum NestedB: String, CodingKey {
        case hello, world
    }
}


let mirror = Mirror(reflecting: StructA.self)
print(mirror.children)

for (label, value) in mirror.children {
    print("label == \(label ?? "")")
    print("value == \(value)")
}

