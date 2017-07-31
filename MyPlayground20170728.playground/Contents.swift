//: Playground - noun: a place where people can play

import UIKit

protocol TestProtocol {
    func doTest()
}

struct TestStruct<T> {
    var items = [T]()

    mutating func addItem(item: T) {
        items.append(item)
    }

    mutating func popItem(index: Int) -> T? {
        guard items.count > index else {
            return nil
        }

        if let item = items[index] as? TestProtocol {
            item.doTest()
        }

        return items.remove(at: index)

    }
    
    func getItem(index: Int) -> T? {
        guard items.count > index else {
            return nil
        }
        
        if let item = items[index] as? TestProtocol {
            item.doTest()
        }
        
        return items[index]
    }

    func getDummy() -> Any? {
        return "hello"
    }

    func getClass() -> T.Type {
        return T.self
    }
    
    func count() -> Int {
        return items.count
    }
}

extension String: TestProtocol {
    func doTest() {
        print(" test in String")
    }
}

extension NSString: TestProtocol {
    func doTest() {
        print(" test in NSString")
    }
}

var test = TestStruct<String>()
test.addItem(item: "hello")
test.addItem(item: "world")
test.addItem(item: "good")
test.addItem(item: "to")
test.addItem(item: "see")
test.addItem(item: "you")

print(test.popItem(index: 0) ?? "")
print(test.popItem(index: 0) ?? "")
print(test.count())
print(test.getClass())

var test2 = TestStruct<NSString>()
test2.addItem(item: "hello")
test2.addItem(item: "world")
test2.addItem(item: "good")
test2.addItem(item: "to")
test2.addItem(item: "see")
test2.addItem(item: "you")

print(test2.popItem(index: 0) ?? "")
print(test2.popItem(index: 0) ?? "")
print(test2.popItem(index: 0) ?? "")
print(test2.count())
print(test2.getClass())

