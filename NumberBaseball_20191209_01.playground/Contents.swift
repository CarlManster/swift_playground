import UIKit

extension Int {
    var digitCount: Int {
        return Int(log10(Double(self))) + 1
    }
}

enum RangeType {
    case excludeZero
    case includeZero
    
    var range: ClosedRange<Int> {
        switch self {
        case .excludeZero: return 1...9
        case .includeZero: return 0...9
        }
    }
}

func generateAll(targetDigit: Int) -> [String] {
    return appendNumber(current: "", targetDigit: targetDigit)
}

func appendNumber(current: String, targetDigit: Int) -> [String] {
    var result: [String] = []
    for i in rangeType.range {
        if current.contains("\(i)") { continue }
        let value = current + "\(i)"
        if value.count < targetDigit {
            result.append(contentsOf: appendNumber(current: value, targetDigit: targetDigit))
        } else {
            result.append(value)
        }
    }
    return result
}

func compare(value: String, target: String) -> (strike: Int, ball: Int) {
    guard value.count == target.count else { return (-1, -1) }
    var strike: Int = 0
    var ball: Int = 0
    
    for (idxValue, i) in Array(value).enumerated() {
        for (idxTarget, j) in Array(target).enumerated() where i == j {
            if idxValue == idxTarget {
                strike += 1
            } else {
                ball += 1
            }
        }
    }
    
    return (strike, ball)
}

func checkValid(bundle: [Int], target: String) -> Bool {
    guard bundle.count == 3 else { return false }
    let value = "\(bundle[0])"
    let strikeAndBall = (bundle[1], bundle[2])
    
    return compare(value: value, target: target) == strikeAndBall
}

func findSolution(conditions: [[Int]]) -> [String] {
    guard conditions.count > 0 else { return [] }
    var result: [String] = generateAll(targetDigit: conditions[0][0].digitCount)
    for condition in conditions {
        result = result.filter { checkValid(bundle: condition, target: $0) }
    }

    return result
}

let rangeType: RangeType = .includeZero
let conditions: [[Int]] = [[123, 1, 0], [456, 1, 0], [789, 0, 1], [196, 1, 0]]
let solution = findSolution(conditions: conditions)

print("condition matches \(solution.count) == \(solution)")
