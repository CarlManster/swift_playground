import UIKit

enum HelloEnum {
    case success(Int)
    case failure(Error)
}

var enm: [HelloEnum] = [.success(1), .failure(NSError(domain: "Hello", code: 300, userInfo: nil)), .success(10), .success(0) ]

enm.forEach { (each) in
    switch each {
    case let .success(value):
        print("success == \(value)")
    case let .failure(error):
        print("failure == \(error)")
    }
}

enm.forEach { (each) in
    switch each {
    case .success(let value):
        print("success == \(value)")
    case .failure(let error):
        print("failure == \(error)")
    }
}

enm.forEach { (each) in
    switch each {
    case .success(10):
        print("success == 10!!")
    case .success(let value) where value >= 1:
        print("success over 1!")
    case .success(_):
        print("success under 1!")
    default:
        print("failure !")
    }
}
