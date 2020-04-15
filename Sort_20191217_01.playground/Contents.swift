import UIKit

func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    return commands.compactMap {
        guard $0.count >= 3 else { return nil }
        return array[($0[0] - 1)..<$0[1]].sorted()[$0[2] - 1]
    }
}

struct QuestionSet {
    let array: [Int]
    let commands: [[Int]]
    
    func ask() {
        print("result of array \(array), commands \(commands)\n\t==> \(solution(array, commands))")
    }
}

let q1 = QuestionSet(array: [1, 5, 2, 6, 3, 7, 4], commands: [[2, 5, 3], [4, 4, 1], [1, 7, 3]])

q1.ask()
