//: Playground - noun: a place where people can play

import UIKit

extension Array where Element == String? {
    var validFirst: Element {
        return self.flatMap { $0 }.first
    }
}

var strA: String? = "hello"
var strB: String? = "world"
var strC: String? = "nice"
var strD: String? = nil
var strE: String? = "to"
var strF: String? = "see"
var strG: String? = "you"
var strH: String? = nil
var strI: String? = "I'm"
var strJ: String? = "Groot"
var strK: String? = nil

let base1 = [strA, strB, strC, strD, strE, strF, strG]
let base2 = [strD, strH, strF, strG]
let base3 = [strD, strH]

let result1 = base1.validFirst
let result2 = base2.validFirst
let result3 = base3.validFirst

