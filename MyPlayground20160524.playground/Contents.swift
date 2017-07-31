//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func doLoop(priority:String, count:Int) {
    print("Loop \(priority) - (\(count))")
}

func doDispatchTest() {
    print("Dispatch Start")
    
    let lowPriorityQueue = DispatchQueue.global(qos: .utility) // dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
    let highPriorityQueue = DispatchQueue.global(qos: .userInitiated) // dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
    
    let dispatchGroup = DispatchGroup() // dispatch_group_create()
    
    let notifyQueue = DispatchQueue.main // dispatch_get_main_queue()
    
    dispatchGroup.notify(queue: notifyQueue) { 
        print("notified")
    }
    
    for a in 1...5 {
        lowPriorityQueue.async(group: dispatchGroup) {
            doLoop(priority: "Low", count: a)
        }
    }
    
    for b in 1...5 {
        highPriorityQueue.async(group: dispatchGroup) {
            doLoop(priority: "High", count: b)
            Thread.sleep(forTimeInterval: 0.05)
        }
    }
    
    print("end of func")
}

doDispatchTest()

func doTest() {
    var x = ""
}
