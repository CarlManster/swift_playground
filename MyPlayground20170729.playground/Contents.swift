//: Playground - noun: a place where people can play

import UIKit

protocol Child {
    func doWork() -> String
}

struct Son: Child {
    func doWork() -> String {
        return "Son"
    }
}

class Daughter: Child {
    func doWork() -> String {
        return "Daughter"
    }
}

enum ChildType {
    case son, daughter
}

func getChild(type: ChildType) -> Child {
    switch type {
    case .son:
        return Son()
    case .daughter:
        return Daughter()
    }
}

func getChildWork(type: ChildType) -> String {
    let child = getChild(type: type)
    
    return child.doWork()
}

print(getChildWork(type: .daughter))
print(getChildWork(type: .son))

