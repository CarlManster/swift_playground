import UIKit

let group = CAAnimationGroup()
group.repeatCount = .infinity


enum Drink {
    struct Option: OptionSet {
        let rawValue: Int
        
        static let decaffein    = Option(rawValue: 1 << 1)
        static let withoutIce   = Option(rawValue: 1 << 2)
        static let withoutSugar = Option(rawValue: 1 << 3)
    }
    
    case juice(Option)
    case coffee(Option)
    case empty
}

struct Tumbler {
    var content: Drink
}
