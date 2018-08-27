//: Playground - noun: a place where people can play

import Foundation

extension Collection {
    var randomElement: Element? {
        guard isEmpty == false else { return nil }
        
        let offset = arc4random_uniform(numericCast(count))
        let index = self.index(startIndex, offsetBy: numericCast(offset))
        return self[index]
    }
    
    func randomElement(defaultValue: Element) -> Element {
        return self.randomElement ?? defaultValue
    }
    
    func samples(_ sampleCount: UInt) -> [Element] {
        let actualSampleCount = Swift.min(count, numericCast(sampleCount))
        
        var elements = Array(self)
        var samples: [Element] = []
        
        while samples.count < actualSampleCount {
            let index = (0..<elements.count).randomElement(defaultValue: 0)
            samples.append(elements.remove(at: index))
        }
        
        return samples
    }
    
    func dictionary(with values: [Any]) -> [AnyHashable : Any] {
        var result: [AnyHashable : Any] = [:]
        
        for (index, key) in self.enumerated() {
            if let key = key as? AnyHashable,
                values.count > index {
                
                result[key] = values[index]
            }
        }
        
        return result
    }
}

extension Array {
    mutating func shuffle() {
        guard count > 0 else { return }
        
        for index in (1..<count).reversed() {
            let j = (0...index).randomElement(defaultValue: 0)
            self.swapAt(j, index)
        }
    }
    
    var shuffled: [Element] {
        var elements = self
        elements.shuffle()
        return elements
    }
}

let names = ["Alice", "Bob", "Carol", "Dave", "Eve", "Frank", "Grace", "Heidi"]
var namesCount = names.dictionary(with: Array(0..<names.count)) as? [AnyHashable : Int] ?? [:]

(0..<10).forEach { (index) in
    let name = names.randomElement
    
    if let name = name, let value = namesCount[name] {
         let newValue = value + 1
        
        namesCount[name] = newValue
    }
    
    print("\(index) == \(name ?? "")")
}

print(namesCount)

let samples = names.samples(4)

print(samples)

(0..<10).forEach { (_) in
    print(samples.shuffled)
}





