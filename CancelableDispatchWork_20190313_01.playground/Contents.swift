import UIKit

var totalWorkCount = 0

func generateWorkItem(count: Int) -> [DispatchWorkItem] {
    var workItems: [DispatchWorkItem] = []
    
    for number in 0..<count {
        workItems.append(DispatchWorkItem {
            print("work number == \(number), accumulated == \(totalWorkCount)")
            totalWorkCount += 1
        })
    }
    
    return workItems
}

let workItems = generateWorkItem(count: 30)

for workItem in workItems {
    let queue = DispatchQueue.global(qos: .background)
    
    queue.async(execute: workItem)
}

for enumeration in workItems.enumerated() {
    switch enumeration.offset % 2 {
    case 1:
        enumeration.element.cancel()
    default:
        break
    }
}




