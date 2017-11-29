//: Playground - noun: a place where people can play

import UIKit

struct Type {
    var numberCode: Int = 0
    var stringCode: String = ""
}

enum TypeEnum: CustomStringConvertible, CustomDebugStringConvertible {
    case apple
    case banana
    
    init(number: Int) {
        switch number {
        case 0:
            self = .apple
        default:
            self = .banana
        }
    }
    
    init(string: String) {
        switch string.lowercased() {
        case "apple":
            self = .apple
        default:
            self = .banana
        }
    }
    
    var type: Type {
        var result = Type()
        
        switch self {
        case .apple:
            result.numberCode = 0
            result.stringCode = "apple"
        case .banana:
            result.numberCode = 1
            result.stringCode = "banana"
        }
        
        return result
    }
    
    var description: String {
        return "\(self.type.numberCode), \(self.type.stringCode)"
    }
    
    var debugDescription: String {
        return "\(self.type.numberCode), \(self.type.stringCode)"
    }
}

let enumValue0 = TypeEnum(number: 0)
let enumValue1 = TypeEnum(number: 1)
let enumValueApple = TypeEnum(string: "apple")

print(enumValue0)
print(enumValue1)
print(enumValueApple)

