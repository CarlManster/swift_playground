//: Playground - noun: a place where people can play

import UIKit

func test1() {
    var array = Array(0...10000)
    
    func nested() {
        array.removeLast()
        array.withUnsafeBufferPointer { ptr in
            print("buffer pointer == \(ptr)")
        }
    }
    
    let count = array.count
    
    for _ in 0..<count {
        nested()
    }
}

func test2() {
    var array = Array(0...10000) {
        didSet {
            array.withUnsafeBufferPointer { ptr in
                print("buffer pointer == \(ptr)")
            }
        }
    }
    
    let count = array.count
    
    for _ in 0..<count {
        array.removeLast()
    }
}

test1()
test2()
