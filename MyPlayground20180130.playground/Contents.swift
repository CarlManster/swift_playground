//: Playground - noun: a place where people can play

import UIKit

class HelloWorld: NSObject {
    static let notificationName = NSNotification.Name("NotificationName")
    
    var observer: Any?
    
    override init() {
        observer = NotificationCenter.default.addObserver(forName: HelloWorld.notificationName,
                                                          object: nil, queue: OperationQueue.main) { (notification) in
                                                            print("notification received == \(notification.description)")
        }
        
        print("observer == \(observer.debugDescription)")
    }
    
    deinit {
        print("deinit")
        NotificationCenter.default.removeObserver(observer, name: HelloWorld.notificationName, object: nil)
    }
}


var a: HelloWorld? = HelloWorld()

NotificationCenter.default.post(name: HelloWorld.notificationName, object: nil)

a = nil

NotificationCenter.default.post(name: HelloWorld.notificationName, object: nil)






// 실습과제 : 답 예시
// Anonymous function, Pure function
let inRange: (Int) -> Bool = { (_ value: Int) -> Bool in
    return value <= 9
}

// Pure function
func print(left: Int, right: Int) {
    print("\(left) * \(right) = \(left * right)")
}

// Higher-order function
func gugudan(pair: (left: Int, right: Int) = (1, 1), checker: (Int) -> Bool) {
    if checker(pair.left) == false || checker(pair.right) == false { return }
    
    if pair.right == 1 { print("\n### \(pair.left)단 ###") }
    
    print(left: pair.left, right: pair.right)
    
    if checker(pair.right + 1) {
        gugudan(pair: (pair.left, pair.right + 1), checker: checker)
    } else {
        gugudan(pair: (pair.left + 1, 1), checker: checker)
    }
}

gugudan(checker: inRange)




