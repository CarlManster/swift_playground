//: Playground - noun: a place where people can play

import Foundation

// Group by property
extension Sequence {
    func group<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType) -> [[Iterator.Element]] {
        var groups: [GroupingType: [Iterator.Element]] = [:]
        var groupsOrder: [GroupingType] = []
        forEach { element in
            let key = key(element)
            if case nil = groups[key]?.append(element) {
                groups[key] = [element]
                groupsOrder.append(key)
            }
        }
        return groupsOrder.map { groups[$0] ?? [] }
    }
}

extension Array {
    func random() -> Iterator.Element {
        let randomIdx = Int(arc4random_uniform(UInt32(count)))
        
        return self[randomIdx]
    }
    
    func split(with condition: ((Element) -> Bool)) -> [[Element]] {
        let split = reduce(([Element](), [Element]())) { (value, element) -> ([Element], [Element]) in
            var newValue = value
            
            if condition(element) == true {
                newValue.0.append(element)
            } else {
                newValue.1.append(element)
            }
            
            return newValue
        }
        
        return [split.0, split.1]
    }
}

struct Person: CustomStringConvertible {
    static let familyNames = ["김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안", "송", "류", "전"]
    static let lastNames = ["하준", "도윤", "서준", "시우", "민준", "주원", "예준", "유준", "지호", "준우", "하윤", "서윤", "서연", "하은", "지유", "하린", "지우", "수아", "지아", "서아"]
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale.current
        
        return formatter
    }()
    
    static func makeRandomPeople(count: Int) -> [Person] {
        var result: [Person] = []
        
        if count > 0 {
            let limit = UInt32(Date().timeIntervalSince1970)
            
            (0..<count).forEach({ (_) in
                let birthTimeInterval: TimeInterval = {
                    let time = arc4random_uniform(limit)
                    
                    return TimeInterval(time - (time % 86400) + 32400)
                }()
                
                let name = "\(familyNames.random())\(lastNames.random())"
                let birthDay = Date(timeIntervalSince1970: birthTimeInterval)
                
                result.append(Person(name: name, birthDay: birthDay))
            })
        }
        
        return result
    }
    
    var name: String
    var birthDay: Date
    
    var age: Int {
        return Int((Date().timeIntervalSince1970 - birthDay.timeIntervalSince1970) / (365.24 * 86400.0))
    }
    
    var birth: String {
        return Person.formatter.string(from: birthDay)
    }
    
    var description: String {
        return "\n\t\(name): \(birth) => \(age)"
    }
}

let people = Person.makeRandomPeople(count: 500)
print("people == \(people)\n")

let split = people.split { $0.age > 15 }
print("split == \(split)\n")

let group = (split.first?.group { $0.name } ?? []).map { ($0.first?.name ?? "No Name", $0.count) }.filter { $0.1 > 1 }
print("group == \(group)\n")
