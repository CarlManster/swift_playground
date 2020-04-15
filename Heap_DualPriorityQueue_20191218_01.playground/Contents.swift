import UIKit

struct OperationItem: CustomStringConvertible {
    enum OperationType: String {
        case insert = "I"
        case delete = "D"
    }
    
    let type: OperationType
    let number: Int
    
    init?(op: String) {
        let split = op.split(separator: " ").map { String($0) }
        guard split.count >= 2,
            let opType = OperationType(rawValue: split[0])
            else { return nil }
        type = opType
        number = Int(split[1]) ?? 0
    }
    
    var description: String {
        return "\n\t{ type == \(type), number == \(number) }"
    }
}

func solution(_ operations: [String]) -> [Int] {
    var result: [Int] = []
    let parsed = operations.compactMap { OperationItem(op: $0) }
    
    for item in parsed {
        switch item.type {
        case .insert:
            result.append(item.number)
        case .delete:
            if item.number == 1, let max = result.max(), let target = result.firstIndex(of: max) {
                result.remove(at: target)
            } else if item.number == -1, let min = result.min(), let target = result.firstIndex(of: min) {
                result.remove(at: target)
            }
        }
    }
    
    return [result.max() ?? 0, result.min() ?? 0]
}

struct QuestionSet {
    let operations: [String]
    
    func ask() {
        print("result of operations \(operations)\n\t==> \(solution(operations))")
    }
}

let q1 = QuestionSet(operations: ["I 16","D 1"])
let q2 = QuestionSet(operations: ["I 7","I 5","I -5","D -1"])
let q3 = QuestionSet(operations: ["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"])
let q4 = QuestionSet(operations: ["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])

q1.ask()
q2.ask()
q3.ask()
q4.ask()
