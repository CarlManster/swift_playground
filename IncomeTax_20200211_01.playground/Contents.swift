import Cocoa

let taxRate: [Int: Double] = [0: 0.0, 12000000: 0.06, 46000000: 0.15, 88000000: 0.24, 150000000: 0.36, 300000000: 0.38, 500000000: 0.4, Int.max: 0.42]
let taxRateKeys: [Int] = taxRate.keys.sorted().reversed()

func calcIncomeTax(_ income: Int) -> Double {
    var tax: Double = 0.0
    for (index, key) in taxRateKeys.enumerated() {
        guard index < taxRateKeys.count - 1 else { break }
        tax += Double(max(0, min(income, taxRateKeys[index]) - taxRateKeys[index + 1])) * (taxRate[key] ?? 0.0)
    }
    
    return tax
}

for income in Array(stride(from: 10000000, to: 1000000000, by: 10000000)) {
    print("income == \(income), tax == \(calcIncomeTax(income))")
}

