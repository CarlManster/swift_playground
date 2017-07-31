//: Playground - noun: a place where people can play

import UIKit

extension String {
    
    var length : Int {
        get {
            return self.characters.count
        }
    }
    
    func rangeWithNSRange(range : NSRange) -> Range<Index> {
        let start : Index = max(self.startIndex, self.startIndex.advancedBy(range.location))
        let end : Index = min(self.startIndex.advancedBy(range.location + range.length), self.endIndex)
        
        return start..<end
    }
    
    mutating func appendString(str : String) {
        self = self + str
    }

    func extractStringWithPattern(pattern: String, expressionOptions:NSRegularExpressionOptions, matchingOptions:NSMatchingOptions) -> String? {
        do {
            let regex : NSRegularExpression = try NSRegularExpression(pattern: pattern, options: expressionOptions)
            let arrayMatches : [NSTextCheckingResult] = regex.matchesInString(self, options: matchingOptions, range: NSMakeRange(0, self.length))

            var strResult : String = String("")
            
            for resultMatch in arrayMatches {
                strResult.appendString(self.substringWithRange(rangeWithNSRange(resultMatch.range)))
            }
        
            return strResult
        } catch {
        
        }
    
        return nil
    }
}