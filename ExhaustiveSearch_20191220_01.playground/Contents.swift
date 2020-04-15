import UIKit

func solution(_ answers: [Int]) -> [Int] {
    let studentsPattern = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    
    let scores = answers.enumerated().reduce(Array(repeating: 0, count: studentsPattern.count)) { (result, item) -> [Int] in
        result.enumerated().map {
            let pattern = studentsPattern[$0.offset]
            return (pattern[item.offset % pattern.count] == item.element) ? $0.element + 1 : $0.element
        }
    }
    
    return scores.enumerated().filter { $0.element == scores.max() }.map { $0.offset + 1 }
}

struct QuestionSet {
    let answers: [Int]
    
    func ask() {
        print("result of answers \(answers)\n\t==> \(solution(answers))")
    }
}

let q1 = QuestionSet(answers: [1, 2, 3, 4, 5])
let q2 = QuestionSet(answers: [1, 3, 2, 4, 2])

q1.ask()
q2.ask()
