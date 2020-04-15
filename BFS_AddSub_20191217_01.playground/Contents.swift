import UIKit

func solution(_ numbers: [Int], _ target: Int) -> Int {
    func calculate(_ pool: [Int], _ calculated: Int) -> [Int] {
        let add = calculated + pool[0]
        let sub = calculated - pool[0]
        if pool.count == 1 {
            return [add, sub]
        } else {
            let next = Array<Int>(pool[1..<pool.count])
            return calculate(next, add) + calculate(next, sub)
        }
    }
    
    return calculate(numbers, 0).filter { $0 == target }.count
}

struct QuestionSet {
    let numbers: [Int]
    let target: Int
    
    func ask() {
        print("result of numbers \(numbers), target \(target)\n\t==> \(solution(numbers, target))")
    }
}

let q1 = QuestionSet(numbers: [1, 1, 1, 1, 1], target: 3)

q1.ask()
