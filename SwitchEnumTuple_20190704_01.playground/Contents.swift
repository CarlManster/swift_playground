import UIKit

enum First {
    case fFirst
    case fSecond
    case fThird
}

enum Second {
    case sFirst
    case sSecond
    case sThird
}


func printValue(first: First, second: Second) {
    switch (first, second) {
    case (.fFirst, .sFirst):
        print("all first")
    case (.fFirst, _):
        print("first of first")
    case (_, .sSecond):
        print("second of second")
    case (_, _):
        print("rest of them")
    }
    print("====================")
}

printValue(first: .fFirst, second: .sFirst)
printValue(first: .fFirst, second: .sThird)
printValue(first: .fFirst, second: .sSecond)
printValue(first: .fSecond, second: .sSecond)
printValue(first: .fThird, second: .sThird)
