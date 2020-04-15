import UIKit

func unless(_ condition: () -> Bool, do closure: @escaping () -> ()) {
    guard !condition() else {
        return
    }
    
    closure()
}

var result: Bool = false

unless({ result }) {
    print("start")
}
