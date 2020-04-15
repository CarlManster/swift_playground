import UIKit

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var students: [Int] = Array<Int>(repeating: 1, count: n)
    
    lost.forEach { students[$0 - 1] -= 1 }
    reserve.forEach { students[$0 - 1] += 1 }
    
    for (index, student) in students.enumerated() where student > 1 {
        if index > 0, students[index - 1] == 0 {
            students[index] -= 1
            students[index - 1] += 1
        } else if index < n-1, students[index + 1] == 0 {
            students[index] -= 1
            students[index + 1] += 1
        }
    }
    
    return students.filter { $0 > 0 }.count
}

struct QuestionSet {
    let number: Int
    let lost: [Int]
    let reserve: [Int]
}

let q1 = QuestionSet(number: 5, lost: [2, 4], reserve: [1, 3, 5])
let q2 = QuestionSet(number: 5, lost: [2, 4], reserve: [3])
let q3 = QuestionSet(number: 3, lost: [3], reserve: [1])
let q4 = QuestionSet(number: 10, lost: [2], reserve: [10])

solution(q1.number, q1.lost, q1.reserve)
solution(q2.number, q2.lost, q2.reserve)
solution(q3.number, q3.lost, q3.reserve)
solution(q4.number, q4.lost, q4.reserve)
