//: Playground - noun: a place where people can play

import UIKit

class A {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    lazy var asResult: () -> String = { [weak self] in
        return "result == \(self?.name ?? "")"
    }
    
    deinit {
        print("class A with \(name) will be deallocated")
    }
}

class B {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func asResult() -> String {
        return "result == \(self.name)"
    }
    
    deinit {
        print("class B with \(name) will be deallocated")
    }
}


var valueA: A? = A(name: "hello")
valueA?.asResult()
valueA = nil


var valueB: B? = B(name: "world")
valueB?.asResult()
valueB = nil
