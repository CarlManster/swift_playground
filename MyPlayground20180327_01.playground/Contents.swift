//: Playground - noun: a place where people can play

import UIKit

enum TestEnum {
    case hello
    case world
    case swift
}

func check(value: TestEnum?) {
    switch value {
    case .hello?:
        print("found hello")
    case .world?:
        print("found world")
    default:
        print("nothing")
    }
}

var value1: TestEnum? = .hello
var value2: TestEnum? = .world
var value3: TestEnum? = .swift
var value4: TestEnum?

check(value: value1)
check(value: value2)
check(value: value3)
check(value: value4)

