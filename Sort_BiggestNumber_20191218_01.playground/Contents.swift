import UIKit

func solution(_ numbers: [Int]) -> String {
    let sorted = numbers.map { "\($0)" }.sorted { (Int($0 + $1) ?? 0) > (Int($1 + $0) ?? 0) }
    return sorted.reduce("") { ($0 == "0") ? $1 : $0 + $1 }
}

struct QuestionSet {
    let numbers: [Int]
    
    func ask() {
        print("result of numbers \(numbers)\n\t==> \(solution(numbers))")
    }
}

let q1 = QuestionSet(numbers: [6, 10, 2])
let q2 = QuestionSet(numbers: [3, 30, 34, 5, 9])
let q3 = QuestionSet(numbers: [0, 0, 0, 0, 0])

q1.ask()
q2.ask()
q3.ask()
