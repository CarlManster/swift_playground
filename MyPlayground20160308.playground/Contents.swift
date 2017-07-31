//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func makeDate(year ayear : Int, month : Int, day : Int) -> NSDate {
    let component = NSDateComponents();
    
    component.year = ayear;
    component.month = month;
    component.day = day;
    
    if let result = NSCalendar.currentCalendar().dateFromComponents(component) as NSDate! {
        return result;
    }
    
    return NSDate()
}

var timeZone = NSTimeZone(name: "ko_KR")

var arrayData : NSArray = [
    [ "payee" : "Green Power", "amount" : 120.00, "date" : makeDate(year: 2009, month: 12, day: 1) ],
    [ "payee" : "Green Power", "amount" : 150.00, "date" : makeDate(year: 2010, month: 1, day: 1) ],
    [ "payee" : "Green Power", "amount" : 170.00, "date" : makeDate(year: 2010, month: 2, day: 1) ],
    [ "payee" : "Car Loan", "amount" : 250.00, "date" : makeDate(year: 2010, month: 1, day: 15) ],
    [ "payee" : "Car Loan", "amount" : 250.00, "date" : makeDate(year: 2010, month: 2, day: 15) ],
    [ "payee" : "Car Loan", "amount" : 250.00, "date" : makeDate(year: 2010, month: 3, day: 15) ],
    [ "payee" : "General Cable", "amount" : 120.00, "date" : makeDate(year: 2009, month: 12, day: 1) ],
    [ "payee" : "General Cable", "amount" : 155.00, "date" : makeDate(year: 2010, month: 1, day: 1) ],
    [ "payee" : "General Cable", "amount" : 120.00, "date" : makeDate(year: 2010, month: 2, day: 1) ],
    [ "payee" : "Mortgage", "amount" : 1250.00, "date" : makeDate(year: 2010, month: 1, day: 15) ],
    [ "payee" : "Mortgage", "amount" : 1250.00, "date" : makeDate(year: 2010, month: 2, day: 15) ],
    [ "payee" : "Mortgage", "amount" : 1250.00, "date" : makeDate(year: 2010, month: 3, day: 15) ],
    [ "payee" : "Animal Hospital", "amount" : 600.00, "date" : makeDate(year: 2010, month: 7, day: 15) ]
]

if let arrayDUnionPayee = arrayData.valueForKeyPath("@distinctUnionOfObjects.payee") as? NSArray { print(arrayDUnionPayee); }
if let arrayUnionPayee = arrayData.valueForKeyPath("@unionOfObjects.payee") as? NSArray { print(arrayUnionPayee); }

if let sumAmount = arrayData.valueForKeyPath("@sum.amount") as? Double { print(sumAmount); }
if let avgAmount = arrayData.valueForKeyPath("@avg.amount") as? Double { print(avgAmount); }

if let minAmount = arrayData.valueForKeyPath("@min.date") as? NSDate { print(minAmount.descriptionWithLocale(NSLocale.currentLocale())); }
if let maxAmount = arrayData.valueForKeyPath("@max.date") as? NSDate { print(maxAmount.descriptionWithLocale(NSLocale.currentLocale())); }

let urlOriginal = "http://m.ticketmonster.co.kr/deal/293937847?title=안녕바다?"
var urlFinal : String? = nil

if urlOriginal.respondsToSelector(Selector("stringByAddingPercentEncodingWithAllowedCharacters:")) {
    urlFinal = urlOriginal.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
} else {
    urlFinal = urlOriginal.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
}

if let urlString = urlFinal as String! {
    NSURL(string: urlString)
}


// Struct / Enum / Guard / Defer

struct TestStruct {
    enum TestValidation {
        case Normal
        case FirstError
        case SecondError
    }
    
    var first : Int?
    var second : Int?
    
    private(set) var third = 9
    
    init(first fir: Int?, second sec: Int?) {
        first = fir
        second = sec
    }
    
    func valid() -> TestValidation {
        guard let firstValue = first where firstValue > 0 else {
            return TestValidation.FirstError;
        }
        
        guard let _ = second else {
            return TestValidation.SecondError;
        }
        
        return TestValidation.Normal
    }
    
    func total() -> Int {
        guard let firstValue = first where firstValue > 0 else {
            return 0;
        }
        
        defer {
            print("firstValue == \(firstValue)");
        }
        
        guard let secondValue = second else {
            return firstValue * third;
        }
        
        defer {
            print("secondValue == \(secondValue)");
        }
        
        return firstValue + secondValue * third;
    }
}

var s1 = TestStruct(first: nil, second: 1)
var s2 = TestStruct(first: 0, second: 20)
var s3 = TestStruct(first: 10, second: nil)
var s4 = TestStruct(first: 10, second: 0)
var s5 = TestStruct(first: 10, second: 20)

var array = [[s1, s2], [s3, s4, s5]]
var arrayFlat = array.flatMap{ $0 }
var arrayMapValid = arrayFlat.map{ $0.valid() }
var arrayMapTotal = arrayFlat.map{ $0.total() }

dump(arrayMapValid)
dump(arrayMapTotal)


// Monad

infix operator >>= { associativity left }
func >>= <T, U>(lhs:T, rhs:(T)->U) -> U {
    return rhs(lhs)
}

func monadAdd(value : Int?) -> Int {
    if let val = value where val > 0 {
        return val + 1;
    }
    
    return 0;
}

func monadMulti(value : Int?) -> Int {
    if let val = value where val > 0 {
        return val * 3;
    }
    
    return 0;
}

var result1 = 1 >>= monadAdd >>= monadAdd
var result2 = 1 >>= monadAdd >>= monadMulti
var result3 = 1 >>= monadMulti >>= monadAdd
var result4 = 1 >>= monadMulti >>= monadMulti

var result5 = monadAdd(monadAdd(1))
var result6 = monadMulti(monadAdd(1))
var result7 = monadAdd(monadMulti(1))
var result8 = monadMulti(monadMulti(1))





