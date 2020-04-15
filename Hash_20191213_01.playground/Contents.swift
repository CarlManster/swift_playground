import UIKit

func solution(_ clothes: [[String]]) -> Int {
    let classified: [String: [String]] = {
        var temp: [String: [String]] = [:]
        for cloth in clothes {
            guard cloth.count == 2 else { continue }
            
            if temp[cloth[1]] == nil {
                temp[cloth[1]] = [cloth[0]]
            } else {
                temp[cloth[1]]?.append(cloth[0])
            }
        }
        return temp
    }()
    
    var count = 1
    classified.values.map { $0.count + 1 }.forEach { count *= $0 }
    
    return count - 1
}

struct QuestionSet {
    let clothes: [[String]]
    
    func ask() {
        print("result == \(solution(clothes))")
    }
}

let q1 = QuestionSet(clothes: [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
let q2 = QuestionSet(clothes: [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])

q1.ask()
q2.ask()
