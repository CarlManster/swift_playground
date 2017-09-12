//: Playground - noun: a place where people can play

import Foundation

func doAfterCondition(queueId: String, waitCondition: @escaping (() -> Bool), completed: @escaping (() -> Void)) {
    let queue = DispatchQueue(label: queueId)
    
    queue.async {
        let timeInterval: TimeInterval = 0.05
        
        while waitCondition() == true {
            Thread.sleep(forTimeInterval: timeInterval)
        }
        
        print("finished")
        
        DispatchQueue.main.async {
            completed()
        }
    }
}

var continueLoop: Bool = true
var time: UInt64 = 0

Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { (timer) in
    time += 1
    
    if time >= 1000 {
        timer.invalidate()
        
        continueLoop = false
    }
}.fire()

doAfterCondition(queueId: "testQueue", waitCondition: { () -> Bool in
    return (time < 900)
}, completed: {
    print("completed == \(time)")
})

if continueLoop {
    CFRunLoopRun() // for playground
}
