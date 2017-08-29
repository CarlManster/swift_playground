//: Playground - noun: a place where people can play

import UIKit

protocol BaseProto {
    func baseFunc()
}

protocol Proto1 {
    func proto1Func()
}

protocol Proto2 {
    func proto2Func()
}

protocol SubProto1: Proto1 {
    func subProto1Func()
}

enum Enu: Int {
    case zero = 0, one, two, three
}

class Base: NSObject, BaseProto {
    var enu: Enu?
    
    func baseFunc() {
        print("\(type(of: self)).\(#function)")
    }
}

class Test1: Base, Proto1 {
    func proto1Func() {
        print("\(type(of: self)).\(#function)")
    }
}

class Test2: Base, Proto2 {
    func proto2Func() {
        print("\(type(of: self)).\(#function)")
    }
}

class Test3: Proto1, Proto2 {
    func proto1Func() {
        print("\(type(of: self)).\(#function)")
    }
    
    func proto2Func() {
        print("\(type(of: self)).\(#function)")
    }
}

class Test4: Base, Proto1, Proto2 {
    func proto1Func() {
        print("\(type(of: self)).\(#function)")
    }
    
    func proto2Func() {
        print("\(type(of: self)).\(#function)")
    }
}

class Test5: SubProto1 {
    func proto1Func() {
        print("\(type(of: self)).\(#function)")
    }
    
    func subProto1Func() {
        print("\(type(of: self)).\(#function)")
    }
}

func get1() -> BaseProto & Proto1 {
    return Test1()
}

func get2() -> BaseProto & Proto2 {
    return Test2()
}

func get3() -> Proto1 & Proto2 {
    return Test3()
}

func get4() -> BaseProto & Proto1 & Proto2 {
    return Test4()
}

get1().baseFunc()
get1().proto1Func()

get2().baseFunc()
get2().proto2Func()

get3().proto1Func()
get3().proto2Func()

get4().baseFunc()
get4().proto1Func()
get4().proto2Func()

func getItem(_ item: Base?) -> Enu {
    return item?.enu ?? .zero
}

let data: [String] = [ ]

// error
//print(data[0])

extension RawRepresentable where RawValue == Int {
    static var count: RawValue {
        var i: RawValue = 0
        while let _: Any = Self(rawValue: i) { i += 1 }
        return i
    }
}

enum TestEnum: Int {
    case test0
    case test1
    case test2
    case test3
}

TestEnum.count
let enum0 = TestEnum(rawValue: 0)
let enum1 = TestEnum(rawValue: 1)
let enum2 = TestEnum(rawValue: 2)
let enum3 = TestEnum(rawValue: 3)
let enum4 = TestEnum(rawValue: 4)

