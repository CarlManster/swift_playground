import UIKit

let start: Decimal = 50
var result: Decimal = 1
var current: Decimal = start

while current > 1 {
    result *= current
    current -= 1
}

print("result == \(result)")
