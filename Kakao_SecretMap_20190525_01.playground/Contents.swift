import UIKit

extension String {
    func replacingOccurrences<Target, Replacement>(of targets: [Target], with replacements: [Replacement], options: CompareOptions = [], range searchRange: Range<Index>? = nil) -> String where Target : StringProtocol, Replacement : StringProtocol {
        var result = self
        
        zip(targets, replacements)
            .forEach { result = result.replacingOccurrences(of: $0, with: $1, options: options, range: searchRange) }
        
        return result
    }
}

func decrypt(arr0: [Int], arr1: [Int]) -> [String] {
    guard arr0.count == arr1.count else { return [] }
    
    return zip(arr0, arr1)
        .map { UInt8($0) | UInt8($1) }
        .map { String($0, radix: 2) }
        .map { $0.replacingOccurrences(of: ["0", "1"], with: [" ", "#"]) }
}

let first = [9, 20, 28, 18, 11]
let second = [30, 1, 21, 17, 28]

print(decrypt(arr0: first, arr1: second))

let third = [46, 33, 33 ,22, 31, 50]
let fourth = [27 ,56, 19, 14, 14, 10]

print(decrypt(arr0: third, arr1: fourth))

// ["#####", "# # #", "### #", "#  ##", "#####"]
// ["######", "###  #", "##  ##", "#### ", "#####", "### # "]

