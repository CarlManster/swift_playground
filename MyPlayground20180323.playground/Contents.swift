//: Playground - noun: a place where people can play

import UIKit

extension String {
    var 초성: String {
        let hangulConsonants = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        
        return reduce("") { (result, char) in
            let code = Int(String(char).unicodeScalars.reduce(0) {$0 + $1.value}) - 44032
            if code > -1 && code < 11172 {
                let cho = code / 21 / 28
                return result + hangulConsonants[cho]
            }
            return result + String(char)
        }
    }
}

var str = "Hello, playground. I'm 최종민"

print(str.초성)
