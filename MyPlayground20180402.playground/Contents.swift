//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class Handlers {
    private var handlers: [(() -> String)] = []
    private let timeInterval: TimeInterval
    private var timer: Timer?
    
    var count: Int {
        return handlers.count
    }
    
    init(timeInterval: TimeInterval = 1.0) {
        self.timeInterval = timeInterval
    }
    
    func append(handler: @escaping (() -> String)) {
        handlers.append(handler)
        
        if timer == nil {
            self.doNext()
            
            timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { (timer) in
                let count = self.doNext()
                
                if count == 0 {
                    timer.invalidate()
                    self.timer = nil
                }
            }
        }
    }
    
    func doNext() -> Int {
        if let handler = handlers.first {
            print("\(Date()) result == \(handler())")
            handlers.remove(at: 0)
        }
        
        return handlers.count
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = Handlers(timeInterval: 0.5)

queue.append { () -> String in return "Hello" }
queue.append { () -> String in return "World" }
queue.append { () -> String in return "My" }
queue.append { () -> String in return "name" }
queue.append { () -> String in return "is" }
queue.append { () -> String in return "Carl" }

Timer.scheduledTimer(withTimeInterval: 11.0, repeats: false) { (timer) in
    queue.append(handler: { () -> String in return "!!!" })
    timer.invalidate()
}

