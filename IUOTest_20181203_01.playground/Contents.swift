import UIKit

var str0: String? = nil

var str1: String! = str0

switch str1 {
case "AA":
    print("correct!")
case .some(_):
    print("!!")
default:
    print("default!")
}


