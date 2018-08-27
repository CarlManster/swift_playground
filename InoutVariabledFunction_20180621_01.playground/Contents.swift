//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let range = 0..<4

extension String {
    func closedrange(start: Int, end: Int) -> ClosedRange<String.Index> {
        let begin = self.index(self.startIndex, offsetBy: start)
        let finish = self.index(self.startIndex, offsetBy: end)
        
        return begin...finish
    }
}

func hydra(into: inout String) {
    into = String(into.prefix(5).reversed())
}

print(str)
hydra(into: &str)
print(str)
