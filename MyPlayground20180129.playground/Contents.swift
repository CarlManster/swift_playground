//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let swearWords: [String] = [ "새끼", "지랄", "미친", "새꺄", "멍청", "병신", "개새", "개새끼", "미친놈", "죽인다",
                             "꺼져", "ㅂㅅ", "ㄲㅈ", "니미", "fuck", "fuck you", "죽어", "뒤져", "자지", "보지",
                             "잠지", "조또", "좆도", "씨발", "시발", "ㅅㅂ", "빙신", "뒤진다", "바보", "바보똥개",
                             "똥개", "바보똥깨", "바부팅이", "미쳤", "미쳣" ]
let orderedSwearWords: [String]
    = { return swearWords
        .map{ $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
        .filter{ $0.count > 0 }
        .sorted{ $0.count > $1.count } }()

extension String {
    static func randomMask(length: Int) -> String {
        let chars = ["!", "@", "^", "#", "$", "%", "*", "&"]

        var result = ""
        
        for _ in 0..<length {
            result.append(chars[Int(arc4random_uniform(UInt32(chars.count)))])
        }
        
        return result
    }
    
    
    
    func filterSwearWord(completion: @escaping ((String) -> Void)) {
        DispatchQueue.global(qos: .userInitiated).async {
            let filtered = self.filterSwearWord()
            
            DispatchQueue.main.async {
                completion(filtered)
            }
        }
    }
    
    func filterSwearWord() -> String {
        var filtered = self
        
        for word in orderedSwearWords {
//          let replace = String.randomMask(length: word.count)
            
            filtered = filtered.replacingOccurrences(of: word, with: "**", options: [.caseInsensitive])
        }
        
        return filtered
    }
}

print(orderedSwearWords)


var str = "아 이 새끼가 완전 미친거냐? 병신새끼 돌았냐? 지랄하네~~ Fuck you"

Date.timeIntervalSinceReferenceDate
for _ in 0..<99 {
    str.filterSwearWord()
//    str.filterSwearWord(completion: { (_) in
//
//    })
}

str.filterSwearWord(completion: { (result) in
    print("Thread == \(Thread.current.description)")
    print("result == \(result)")
})
Date.timeIntervalSinceReferenceDate

PlaygroundPage.current.needsIndefiniteExecution = true
