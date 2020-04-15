import UIKit

func solution(_ heights: [Int]) -> [Int] {
    var stack = heights
    var result = Array<Int>(repeating: 0, count: heights.count)
    
    while stack.count > 0 {
        if let last = stack.popLast() {
            for (index, rest) in stack.enumerated().reversed() {
                if last < rest {
                    result[stack.count] = index + 1
                    break
                } else {
                    continue
                }
            }
        }
    }
    
    return result
}

struct QuestionSet {
    let heights: [Int]
    
    func ask() {
        print("result of \(heights) == \(solution(heights))")
    }
}

let q1 = QuestionSet(heights: [6, 9, 5, 7, 4])
let q2 = QuestionSet(heights: [3, 9, 9, 3, 5, 7, 2])
let q3 = QuestionSet(heights: [1, 5, 3, 6, 7, 6, 5])

q1.ask()
q2.ask()
q3.ask()
