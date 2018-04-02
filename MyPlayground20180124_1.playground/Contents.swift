//: Playground - noun: a place where people can play

import UIKit

extension UIStoryboard {
    static func instantiate<T>(from boardName: String, type: T.Type) -> T? {
        guard let viewController
            = UIStoryboard(name: boardName, bundle: nil)
                .instantiateViewController(withIdentifier: String(describing: type)) as? T else {
                    return nil
        }
        
        return viewController
    }
}

func calc() -> UInt64 {
    return UInt64((Date().timeIntervalSince1970 * 10000)) % 864000000
}

struct onceDo {
    static let doOnce: UInt64 = {
        return calc()
    }()
}

print("calc == \(calc())")
let a0 = onceDo.doOnce
print("once == \(a0)")
print("calc == \(calc())")
let a1 = onceDo.doOnce
print("once == \(a1)")
print("calc == \(calc())")
let a2 = onceDo.doOnce
print("once == \(a2)")
print("calc == \(calc())")
let a3 = onceDo.doOnce
print("once == \(a3)")
print("calc == \(calc())")
let a4 = onceDo.doOnce
print("once == \(a4)")
print("calc == \(calc())")
let a5 = onceDo.doOnce
print("once == \(a5)")
print("calc == \(calc())")
let a6 = onceDo.doOnce
print("once == \(a6)")
print("calc == \(calc())")
let a7 = onceDo.doOnce
print("once == \(a7)")
print("calc == \(calc())")

