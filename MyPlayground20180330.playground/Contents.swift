 //: Playground - noun: a place where people can play
 
 import UIKit
 
 class Test: Equatable, Codable, CustomStringConvertible {
    var data: String?
    let date: Date
    
    init(_ data: String?) {
        self.data = data
        self.date = Date()
    }
    
    static func == (lhs: Test, rhs: Test) -> Bool {
        if let lData = lhs.data, let rData = rhs.data {
            return lData == rData
        } else if lhs.data == nil, rhs.data == nil {
            return true
        }
        
        return false
    }
    
    var description: String {
        return "data == \(data ?? "nil"), date == \(date)"
    }
 }
 
 var array: [Test] = [Test("hello"), Test(nil), Test("world")]
 
 let result = array.filter { $0.data?.isEmpty == false }
 
 print("result == \(result)")
 
 func compare(lhs: Test, rhs: Test) {
    if lhs == rhs {
        print("equal")
    } else {
        print("not equal")
    }
 }
 
 let test1 = Test("help")
 let test2 = Test("nice")
 let test3 = Test(nil)
 let test4 = Test(nil)
 let test5 = test4
 
 compare(lhs: test1, rhs: test2)
 compare(lhs: test1, rhs: test3)
 compare(lhs: test3, rhs: test4)
 compare(lhs: test4, rhs: test5)
 
 if test3.data == nil {
    print("test3 is nil")
 } else {
    print("test3 is not nil")
 }

