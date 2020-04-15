import UIKit

func solution(_ number: String, _ k: Int) -> String {
    var result: [Int] = []
    var count: Int = 0
    
    Array(number).compactMap { Int(String($0)) }.forEach { item in
        while count < k {
            if let last = result.last, last < item {
                result.popLast()
                count += 1
            } else {
                break
            }
        }
        result.append(item)
    }
    
    return result[0..<(result.count - k + count)].map { "\($0)" }.joined()
}

struct QuestionSet {
    let number: String
    let k: Int
    
    func ask() {
        print("result of number \(number), k \(k)\n\t==> \(solution(number, k))")
    }
}

let q1 = QuestionSet(number: "1924", k: 2)
let q2 = QuestionSet(number: "1231234", k: 3)
let q3 = QuestionSet(number: "4177252841", k: 4)
let q4 = QuestionSet(number: "10000001", k: 3)
let q5 = QuestionSet(number: "1000000", k: 3)

q1.ask()
q2.ask()
q3.ask()
q4.ask()
q5.ask()
