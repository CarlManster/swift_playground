import Foundation

struct Stack<Element>: CustomStringConvertible, ExpressibleByArrayLiteral {
    private var storage: [Element] = []
    
    var isEmpty: Bool { return storage.isEmpty }
    var count: Int { return storage.count }
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func push(_ elements: [Element]) {
        storage.append(contentsOf: elements)
    }
    
    mutating func push(_ stack: Stack<Element>) {
        storage.append(contentsOf: stack.storage)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    func peek() -> Element? {
        return storage.last
    }
    
    func reversed() -> Stack<Element> {
        return Stack(self.storage.reversed())
    }
    
    var description: String {
        return storage.map { "\($0)" }.joined(separator: ", ")
    }
}

extension Stack: Equatable where Element: Equatable {
    static func == (lhs: Stack, rhs: Stack) -> Bool {
        return lhs.storage == rhs.storage
    }
}

var stack = Stack<Int>([0])
stack.push(1)
stack.push(2)
stack.push([3, 4, 5])

print("stack == \(stack)")
print("stack pop == \(stack.pop() ?? -1)")
print("stack == \(stack)")
print("stack pop == \(stack.pop() ?? -1)")
print("stack == \(stack)")
print("stack reversed == \(stack.reversed())")
print("stack == \(stack)")

var saveStack = stack
stack = [9, 8, 7, 6]

print("save stack == \(saveStack)")
print("literal stack == \(stack)")

saveStack.push(stack)
print("save stack == \(saveStack)")

var newStack = stack
print("newStack == \(newStack)")
print("stack pop == \(stack.pop() ?? -1)")
print("newStack == \(newStack)")
print("stack == \(stack)")
