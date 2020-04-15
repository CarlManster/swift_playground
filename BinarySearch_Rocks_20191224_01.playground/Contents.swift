import UIKit

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    let sorted = (rocks + [0, distance]).sorted()
    var result: Int = 0, left: Int = 1, right: Int = distance
    
    while left <= right {
        let mid = (left + right) / 2
        var remove: Int = 0, lastIndex: Int = 0
        
        (1..<sorted.count).forEach {
            if (sorted[$0] - sorted[lastIndex]) < mid { remove += 1 }
            else { lastIndex = $0 }
        }
        
        if remove > n { right = mid - 1 }
        else {
            left = mid + 1
            result = result < mid ? mid : result
        }
    }
    
    return result
}

struct QuestionSet {
    let distance: Int
    let rocks: [Int]
    let n: Int
    
    func ask() {
        print("result of distance \(distance), rocks \(rocks), n \(n)\n\t==> \(solution(distance, rocks, n))")
    }
}

let q1 = QuestionSet(distance: 25, rocks: [2, 14, 11, 21, 17], n: 2)

q1.ask()
