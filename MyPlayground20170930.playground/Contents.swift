//: Playground - noun: a place where people can play

import UIKit

struct Item: CustomStringConvertible {
    var name: String?
    var age: Int = 0
    
    var description: String {
        return "{ name: \(name ?? ""), age: \(age) }"
    }
}

var items: [Item] = []
items.append(Item(name: "A", age: 10))
items.append(Item(name: "C", age: 15))
items.append(Item(name: "B", age: 20))
items.append(Item(name: "R", age: 18))
items.append(Item(name: "T", age: 16))

var items2: [Item?] = []
items2.append(Item(name: "D", age: 11))
items2.append(Item(name: "E", age: 14))
items2.append(nil)
items2.append(Item(name: "F", age: 23))
items2.append(Item(name: "G", age: 19))
items2.append(Item(name: "H", age: 12))

for item in items {
//    item.age = 10 // let - unavailable
}

print("items == \(items)\n")

// filter
let filtered = items.filter { $0.age < 20 }
print("filtered == \(filtered)\n")

// map
let added = filtered.map { Item(name: $0.name ?? "", age: $0.age + 1) }
print("added == \(added)\n")

// reduce
let reduced = added.reduce(Item(name: "", age: 0)) { Item(name: "\($0.name ?? "")\($1.name ?? "")" , age: $0.age + $1.age) }
print("reduced == \(reduced)\n")

// flatmap
print("items2.count == \(items2.count)\n")
let flatmapUnwrapped = items2.flatMap { $0 }
print("flatmapUnwrapped == \(flatmapUnwrapped)\n")
print("flatmapUnwrapped.count == \(flatmapUnwrapped.count)\n")

var itemsMultidepth: [[Item?]] = []
itemsMultidepth.append(items)
itemsMultidepth.append(items2)

let flatmapMultidepth = itemsMultidepth.flatMap { $0 }
print("flatmapMultidepth == \(flatmapMultidepth)\n")

let flatmapMultidepthUnwrapped = flatmapMultidepth.flatMap { $0 }
print("flatmapMultidepthUnwrapped == \(flatmapMultidepthUnwrapped)\n")

// sort
let sorted = flatmapMultidepthUnwrapped.sorted { ($0.name ?? "") < ($1.name ?? "") /* ascending */ }
print("sorted == \(sorted)")


