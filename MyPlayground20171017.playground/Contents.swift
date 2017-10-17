//: Playground - noun: a place where people can play

import UIKit

// Block Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementer = makeIncrementer(forIncrement: 10)

for _ in 0..<5 {
    print("\(incrementer())")
}

print("another")
let anotherIncrementer = makeIncrementer(forIncrement: 7)

for _ in 0..<5 {
    print("\(anotherIncrementer())")
}

print("move to new")
let newIncrementer = incrementer

for _ in 0..<5 {
    print("\(newIncrementer())")
}

print("back to old")
for _ in 0..<5 {
    print("\(incrementer())")
}



// Method Dispatch
protocol OriginProtocol {
    func method1()
//    func method2()
    func method3()
}

struct Struct1: OriginProtocol {
    func method1() {
        print("Called method1 from struct 1")
    }
    
    func method2() {
        print("Called method2 from struct 1")
    }
}

class Class1: OriginProtocol {
    func method1() {
        print("Called method1 from class 1")
    }
    
    func method2() {
        print("Called method2 from class 1")
    }
}

extension OriginProtocol {
    func method1() {
        print("Called method1 from OriginProtocol")
    }
    
    func method2() {
        print("Called method2 from OriginProtocol")
    }
    
    func method3() {
        print("Called method3 from OriginProtocol")
    }
}

struct Struct2: OriginProtocol {
}

print("### s1") // static
let s1 = Struct1()
s1.method1()
s1.method2()
s1.method3()

print("### p1") // dynamic
let p1: OriginProtocol = Struct1()
p1.method1()
p1.method2()
p1.method3()

print("### c1") // static
let c1 = Class1()
c1.method1()
c1.method2()
c1.method3()

print("### p2") // dynamic
let p2: OriginProtocol = Class1()
p2.method1()
p2.method2()
p2.method3()

print("### s2")
let s2 = Struct2()
s2.method1()
s2.method2()
s2.method3()




