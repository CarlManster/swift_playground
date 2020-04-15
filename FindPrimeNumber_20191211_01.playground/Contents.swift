import Foundation

// Eratosthenes's sieve
func sieve(target: Int) -> [Int] {
    var result = Array<Int>(stride(from: 2, to: max(target + 1, 2), by: 1))
    var item = 2
    
    while item <= Int(sqrt(Double(target))) {
        result = result.filter { $0 <= item || ($0 % item > 0) }
        
        item = result[(result.firstIndex(of: item) ?? 0) + 1]
    }
    
    return result
}

let target = 10000
let result = sieve(target: target)

print("finding result to \(target) == \(result), \(result.count)")

for index in stride(from: 10000, to: target + 1, by: 10000) {
    print("under \(index) == \(result.filter { $0 <= index && $0 > index - 10000 }.count)")
}
