//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground! I have 25 examples for swift."

extension String {
    func extractString(pattern: String?, expressionOptions: NSRegularExpression.Options, matchingOptions: NSRegularExpression.MatchingOptions) -> String {
        var result = ""
        
        if let pattern = pattern, pattern.isEmpty == false,
            let regex = try? NSRegularExpression(pattern: pattern, options: expressionOptions) {

            let matches = regex.matches(in: self, options: matchingOptions, range: NSMakeRange(0, self.characters.count))
            
            for match in matches {
                if let range = Range(match.range, in: self) {
                    result.append(String(self[range]))
                }
            }
        }
        return result
    }
}

let result = str.extractString(pattern: "[A-Z]", expressionOptions: [], matchingOptions: .reportCompletion)
print("\(result)")












































