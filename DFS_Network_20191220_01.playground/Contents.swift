import UIKit

struct Computer: CustomStringConvertible {
    var checked: Bool
    let connected: [Int]
    
    var description: String {
        return "\n\t{ checked == \(checked), connected == \(connected) }"
    }
}

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    var networkCount: Int = 0
    var network = computers.enumerated().map { computer -> [Int] in
        computer.element.enumerated().compactMap { $0.element == 1 ? $0.offset : nil }
    }.map { Computer(checked: false, connected: $0) }
    
    func dfs(index: Int) {
        guard !network[index].checked else { return }
        network[index].checked = true
        network[index].connected.forEach { dfs(index: $0) }
    }
    
    (0...n-1).forEach {
        networkCount += network[$0].checked ? 0 : 1
        dfs(index: $0)
    }
    
    return networkCount
}

struct QuestionSet {
    let n: Int
    let computers: [[Int]]
    
    func ask() {
        print("result of n \(n), computers \(computers)\n\t==> \(solution(n, computers))")
    }
}

let q1 = QuestionSet(n: 3, computers: [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
let q2 = QuestionSet(n: 3, computers: [[1, 1, 0], [1, 1, 1], [0, 1, 1]])

q1.ask()
q2.ask()
