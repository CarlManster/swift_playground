//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

var queries: [String : String] = [:]
queries["hello"] = "world"
queries[""] = "no name"
queries["what"] = ""

let filtered = queries
.map { (key: $0.key, value: $0.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")}
.filter { ($0.key.isEmpty == false) && ($0.value.isEmpty == false)}

print(queries)
print(filtered)



let range = 0..<100
let compared = (range ~= 10)


let oops = "최현승아아아아아아아아아가다자바나아다가바나다가바나카나타나나자자다다가나마자바나자다아가라파차타카마나아라가다자바바바바마나자아다가라파라아마나카타나차아라가다잡"
oops.count
