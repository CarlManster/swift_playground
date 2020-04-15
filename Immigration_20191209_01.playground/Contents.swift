import UIKit

// Binary search
func solution(_ n: Int, _ times: [Int]) -> Int64 {
    let sorted = times.sorted()
    
    var left: Int64 = 1
    var right: Int64 = Int64((sorted.last ?? 1) * n)
    
    var answer: Int64 = right
    
    while left <= right {
        let mid = (left + right) / 2
        var sum: Int64 = 0
        
        for i in 0..<sorted.count {
            sum += mid / Int64(sorted[i])
        }
        
        if sum >= n {
            answer = answer > mid ? mid : answer
            right = mid - 1
        } else {
            left = mid + 1
        }
        
        print("answer == \(answer), left == \(left), right == \(right)")
    }
    
    return answer
}

let numberOfCustomer: Int = 100000
let times: [Int] = [7, 10, 8, 9, 5, 12, 5, 6, 4, 3, 2, 2, 11, 3]

let calcuated = solution(numberOfCustomer, times)

print("calcuated == \(calcuated)")
