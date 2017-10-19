//: Playground - noun: a place where people can play

import UIKit

class Hello: NSObject {
    var value = 0
    
    lazy var block1 = { [weak self] in
        return self?.value
    }()
    
    lazy var block2: Int = { [unowned self] in
        return self.value + 1
    }()
    
    func increaseValue(by: Int) {
        value += by
    }
}

let hello = Hello()
hello.increaseValue(by: 10)
let value1 = hello.block1
hello.increaseValue(by: 20)
let value2 = hello.block2

let queue = DispatchQueue(label: "org.manster.test")
queue.asyncAfter(deadline: .now() + .nanoseconds(120000)) {
    print("t1")
}

queue.async { print("a1") }
queue.sync { print("s1") }
queue.async { print("a2") }
queue.sync { print("s2") }
queue.async { print("a3") }
queue.sync { print("s3") }
queue.async { print("a4") }
queue.sync { print("s4") }
queue.async { print("a5") }
queue.sync { print("s5") }


CFRunLoopRun()


