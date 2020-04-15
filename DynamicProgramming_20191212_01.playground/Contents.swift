import UIKit

func solution(_ N: Int, _ number: Int) -> Int {
    var minCount: Int = 9
    
    func calculate(count: Int, result: Int64) {
        guard minCount >= count else { return }
        guard result != number else {
            if count < minCount { minCount = count }
            return
        }
        guard count != 8 else { return }
        
        for i in 1...8-count {
            for j in 0...i/2 {
                var head = 0
                for _ in 1...i-j {
                    head = head * 10 + N
                }
                var next = head
                var tail = 0
                if j > 0 {
                    for _ in 1...j {
                        tail = tail * 10 + N
                    }
                }
                if tail > 0 {
                    next /= tail
                }
                calculate(count: count+i, result: result+Int64(next))
                calculate(count: count+i, result: result-Int64(next))
                calculate(count: count+i, result: result*Int64(next))
                calculate(count: count+i, result: result/Int64(next))
                calculate(count: count+i, result: result*(-1)*Int64(next))
                calculate(count: count+i, result: result*(-1)/Int64(next))
            }
            if i > 2 {
                calculate(count: count+i, result: result)
                calculate(count: count+i, result: 0)
            }
        }
    }
    
    calculate(count: 0, result: 0)
    
    guard minCount < 9 else { return -1 }
    
    return minCount
}

struct QuestionSet {
    let N: Int
    let number: Int
    
    func ask() {
        print("result of N: \(N), number: \(number) == \(solution(N, number))")
    }
}

let q1 = QuestionSet(N: 5, number: 12)
let q2 = QuestionSet(N: 2, number: 11)
let q3 = QuestionSet(N: 1, number: 2)

//q1.ask()
//q2.ask()
q3.ask()
