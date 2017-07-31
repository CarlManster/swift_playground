// Playground - noun: a place where people can play

import Cocoa

let maxPoint : UInt32 = 105
let minPoint : UInt32 = 25
let itemCount : Int = 20

extension Double {
    func doPlus(amount: Double) -> Double {
        return self + amount * 2.0
    }
    
    func doMinus(amount: Double) -> Double {
        return self - amount / 2.0
    }
}

class Generic<T> {
    var data : Array<T> = Array<T>()
    
    init () {
        
    }
    
    func add(t : T) {
        data.append(t)
    }
    
    func count() -> Int {
        return data.count;
    }
    
    func appendFromGeneric(g : Generic<T>) {

    }
    
    func getAtPoint(p : Int) -> T {
        return data[p]
    }
}

class PointCalculator {
    class func makeRandomDictArray() -> Array<Dictionary<String, Int>> {
        return makeRandomDictArray(itemCount);
    }
    
    class func makeRandomDictArray(numberOfRandomArrayItem : Int) -> Array<Dictionary<String, Int>> {
        var group = Array<Dictionary<String, Int>>()
        
        var numberOfArrayItem : Int = Int(numberOfRandomArrayItem)
        
        if (numberOfArrayItem <= 0) {
            numberOfArrayItem = itemCount
        }
        
        for (var i = 0 ; i < numberOfArrayItem ; i++) {
            let pPresent : UInt32 = UInt32(arc4random() % (maxPoint - minPoint)) + minPoint
            let pAmount : UInt32 = UInt32(arc4random() % 20)
            var pDirection = Bool(Int(arc4random() % 2))
            
            if (pDirection && (pPresent + pAmount) > maxPoint) {
                pDirection = false
            } else if (!pDirection && (pPresent - pAmount) < minPoint) {
                pDirection = true
            }
            
            println(NSString(format: "point : %d, prev : %d, direction : %@", pPresent, pAmount, pDirection.description))
            
            var pPrev : Int = 0
            
            if (pDirection) {
                pPrev = Int(pPresent + pAmount);
            } else {
                pPrev = Int(pPresent - pAmount);
            }
            
            group.append(["id" : Int(i+1), "point" : Int(pPresent), "prev" : pPrev])
        }
        
        return group;
    }
    
    class func showResult(groups : Array<Int>?) {
        
        if (groups == nil || groups!.count == 0) {
            println("Nothing in this Group")
            return
        }
        
        for point in groups! {
            let comment = getPointComment(point)
            
            println(NSString(format: "Point : %d - %@", point, comment))
        }
    
        println("");
    }
    
    class func showResult(groups : Array<Dictionary<String, Int>>?, keyname : String) {
        
        if (groups == nil || groups!.count == 0) {
            println("Nothing in this Group")
            return
        }

        for point : Dictionary<String, Int> in groups! {
            let idNumber : Int? = point["id"]
            let pointValue : Int? = point[keyname]

            if pointValue != nil {
                let comment = getPointComment(Int(pointValue!))

                if idNumber != nil {
                    println(NSString(format: "ID: %d, Point : %d - %@", idNumber!, pointValue!, comment))
                }
            } else {
                println("Data Error")
            }
        }

        println("");
    }
    
    class func getPointComment(pointValue : Int?) -> String {
        var comment = NSMutableString()
        
        if pointValue != nil {
            switch (pointValue!) {
                case 0 ... 30 :
                    comment.appendString("WTF")
                case 31 ... 60 :
                    comment.appendString("Bad")
                case 61 ... 80 :
                    comment.appendString("Not bad")
                case 81 ... 90 :
                    comment.appendString("Good")
                case 91 ... 99 :
                    comment.appendString("Very good")
                case 100 :
                    comment.appendString("Excellent")
                default :
                    comment.appendString("Impossible")
            }
        }
        
        
        return comment
    }

    class func showAverage(groups : Array<Int>?) {
        if (groups == nil || groups!.count == 0) {
            println("Nothing in this Group")
            return
        }
    
        var groupsTotal = 0
    
        for point in groups! {
            groupsTotal += point
        }
    
        println(NSString(format: "Total : %d, Count : %d, Average : %d", groupsTotal, groups!.count, groupsTotal / groups!.count))
    }
    
    class func showAverage(groups : Array<Dictionary<String, Int>>?, keyname : String) {
        if (groups == nil || groups!.count == 0) {
            println("Nothing in this Group")
            return
        }
        
        var groupsTotal = 0
        
        for point in groups! {
            var pointValue = point[keyname]
            
            groupsTotal += pointValue!
        }
        
        println(NSString(format: "Total : %d, Count : %d, Average : %d", groupsTotal, groups!.count, groupsTotal / groups!.count))
    }
    
    class func showUpDown(groups : Array<Dictionary<String, Int>>?, presentKey : String, prevKey : String) {
        if (groups == nil || groups!.count == 0) {
            println("Nothing in this Group")
            return
        }
        
        for point in groups! {
            var present : Int? = point[presentKey]
            var prev : Int? = point[prevKey]
            
            if present != nil && prev != nil {
                var change = present! - prev!
            
                var pointMessage = NSMutableString()
            
                if (change > 0) {
                    pointMessage.appendString("Up")
                } else if (change == 0) {
                    pointMessage.appendString("Not Changed")
                } else {
                    pointMessage.appendString("Down")
                }
            
                println(NSString(format: "Point %@ - Present: %d, Previous: %d, Changed: %d", pointMessage, present!, prev!, change))
            }
        }
        
        println("")
    }
}

func showObjectType(obj : AnyObject?) {
    if obj == nil {
        println("Object is nil!");
        
        return;
    }
    
    if (obj!.dynamicType.respondsToSelector(Selector("description"))) {
        println("\(obj!.dynamicType.description()) - \(NSString(UTF8String: object_getClassName(obj!)))")
    } else {
        println("\(obj!.dynamicType) - \(NSString(UTF8String: object_getClassName(obj!)))")
    }
}

let str0 = "Hello, Apple"
var str1 = "Hello, playground"

str1 = str1 + " with Swift"

let int0 = 110.0
var int1 = 230.1

int1 += int0
int1 *= int0

for (var i = 0 ; i < 10 ; i++) {
    int1 -= int0
}

int1 /= int0

var int2 = int1.doPlus(int0)
int2 = int2.doMinus(int0)

var int3 = NSString(format: "%.2lf abcdefghijklmnopqrstuvwxyzv %@", int2, str0)

let groups0 = [11,32,43,74,95,86,137,78,99,110,100]
let groups1 = [93,30,88,23,53,72,83,13,17,92,98,100,101,110]
let groups2 = PointCalculator.makeRandomDictArray(11)

let groups0Sorted = groups0.sorted{ $0 < $1 } // Ascending
let groups1Sorted = groups1.sorted{ $0 > $1 } // Descending
let groups2PointSorted = groups2.sorted{ $0["point"] > $1["point"] }
let groups2PrevSorted = groups2.sorted{ $0["prev"] > $1["prev"] }

showObjectType(int0)
showObjectType(int1)
showObjectType(int2)
showObjectType(int3)
showObjectType(groups0)
showObjectType(groups1)
showObjectType(NSDate().dateByAddingTimeInterval(5.0))
showObjectType(7)
showObjectType(NSArray())
showObjectType(NSMutableArray())
showObjectType([ "value", "value" ])
showObjectType([ "key" : "value" ])

println("")

PointCalculator.showResult(groups0)
PointCalculator.showResult(groups0Sorted)
PointCalculator.showResult(groups1)
PointCalculator.showResult(groups1Sorted)
PointCalculator.showResult(groups2, keyname: "point");
PointCalculator.showResult(groups2PointSorted, keyname: "point");
PointCalculator.showResult(groups2PrevSorted, keyname: "prev");

PointCalculator.showAverage(nil);
PointCalculator.showAverage([])
PointCalculator.showAverage(groups0)
PointCalculator.showAverage(groups1)
PointCalculator.showAverage(groups2, keyname: "point")
PointCalculator.showAverage(groups2, keyname: "prev")

PointCalculator.showUpDown(groups2, presentKey: "point", prevKey: "prev")
PointCalculator.showUpDown(groups2, presentKey: "prev", prevKey: "point")
