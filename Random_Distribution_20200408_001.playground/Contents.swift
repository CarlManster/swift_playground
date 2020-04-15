import Cocoa

struct RandomDistributor {
    struct Option: OptionSet {
        let rawValue: Int
        
        init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        static let readable = Option(rawValue: 1 << 0)
    }
    
    static func distribute(limit: UInt32, count: UInt32, option: Option = []) -> Any {
        func returnForm(result: [UInt32: UInt32], option: Option) -> Any {
            if option.contains(.readable) {
                return result.keys.sorted().reduce("### Result ###\n") { $0.appending("\t\($1): \(result[$1] ?? 0)\n") }
            }
            return result
        }
        
        var result: [UInt32: UInt32] = [:]
        
        guard limit > 0, count > 0 else {
            return returnForm(result: result, option: option)
        }
        
        (0..<count).map { _ in arc4random_uniform(limit + 1) }.forEach { result[$0] = (result[$0] ?? 0) + 1 }
        
        return returnForm(result: result, option: option)
    }
}

print(RandomDistributor.distribute(limit: 9, count: 10000, option: .readable))
