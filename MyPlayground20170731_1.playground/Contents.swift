//: Playground - noun: a place where people can play

import UIKit

/*
 모나드는 특정한 타입을 감싸는 타입이며,
 raw한 값을 감싸는 함수와
 raw한 값을 모나드 값으로 바꾸는 어떤 함수에 바인딩된다.
 
 이를 바탕으로 모나드 프로토콜을 정의하면 다음과 같다.
 
 */
protocol Monad {
    associatedtype Element // associatedtype = typealias + generic
    static func _return_ (n:Self.Element) -> Self
    func _bind_ (f:(Self.Element) -> Self) -> Self
}


/*
 위 정의를 바탕으로 하스켈의 Maybe 타입을
 흉내내어 본다.
 
 이는 대수적으로는 Just A, Nothing 두 가지로 구분되므로
 enum 타입이다.
 */


enum Maybe<T>: Monad, CustomStringConvertible {
    typealias Element = T
    
    case Just(Element)
    case Nothing
    
    //  raw 한 값을 모나드값으로 만드는 함수 monad(_:)를
    //  외부에서 별도 정의하는데, 이는 모나드 값을 만드는
    //  아래 타입 메소드를 호출하게 된다.
    static func _return_ (n:Maybe.Element) -> Maybe {
        return .Just(n)
    }
    
    //  모나드 값을 함수에 바인딩하는 연산자 >>= 를 위한 함수
    func _bind_ (f:(Element) -> Maybe) -> Maybe {
        switch self {
        case .Just(let a):
            return f(a)
        default:
            return .Nothing
        }
    }
    
    //  println 문에 적용
    var description: String {
        switch self {
        case .Just(let a):
            return "Just \(a)"
        default:
            return "Nothing"
        }
    }
}

//  바인드 연산자
precedencegroup LeftPrecedence {
    associativity: left
}

infix operator >>= : LeftPrecedence

//  바인드 연산자는 모나드 타입 내 `_bind_` 메소드를 호출하고 끗.
func >>= <T, U:Monad>(l:U, r:(T) -> U) -> U where U.Element == T {
    return l._bind_(f: r)
}

//  raw 값을 모나드 값으로 바꾼다.
//  이 함수의 반환형은 좌변값의 타입에 의해 결정된다.
func monad <T, U:Monad>(_ a:T) -> U where U.Element == T {
    return Maybe<T>._return_(n: a) as! U
}


//  테스트용 함수 2개. 모나드에 바인딩될 수 있는 타입이다.

func increase(n:Int) -> Maybe<Int> {
    return .Just(n + 1)
}

func fail(n:Int) -> Maybe<Int> {
    return .Nothing
}

// 정수를 감싸는 모나드 타입 테스트
let a: Maybe<Int> = .Just(1)
let b = a >>= increase
let c = a >>= increase >>= increase
let d = a >>= increase >>= fail // .Nothing이 된다.
let e = a >>= increase >>= fail >>= increase
//                         ^~~~~ 여기서 .Nothing이 되었으므로 이후의
//                          모든 바인딩에 대해서는 아무련 효력이 없다.

print([a, b, c, d, e])
//  [Just 1, Just 2, Just 3, Nothing, Nothing]


typealias Pole = Maybe<(left:Int, right:Int)>

func leftLand(birds:Int, pole:(Int, Int)) -> Pole {
    if abs((pole.0 + birds) - pole.1) < 4 {
        return .Just((pole.0 + birds, pole.1))
    }
    
    return .Nothing
}

/*:
 모나드의 멋진점은 연속된 일련의 처리 중에 실패하는 경우(값이 없거나 유효하지 않게 되거나)에
 이후의 흐름을 별도의 분기처리없이 함수를 연속적으로 체이닝하는 것으로 처리할 수 있다는 점이다.
 
 
 이 문서의 이전 버전에서는 막대기를 들고 줄타기를 하는 중에 새가 막대 양쪽에 앉는 경우를 가정했었다.
 이 부분을 커스텀 모나드로 적용해 보도록 하자.
 
 ** Swift의 커리드 함수는 반드시 인자명을 넣어야 해서 >>= 연산자의 적용을 할 수 없다. 따라서
 클로저를 리턴하는 함수를 간접적으로 만들어야 한다.
 */

func landLeft(_ n: Int) -> ((Int, Int)) -> Pole {
    //                     ~~~~~~~~~~~~~~~~~~~~~
    //                     raw한 값을 받아 모나드 값을 리턴하는 것이 포인트!
    return {
        (p:(Int, Int)) -> Pole in
        let (x, y) = p
        if x + n - y > 4 {
            return .Nothing
        }
        let r = (x + n, y)
        return .Just(r)
    }
}

func landRight(_ n: Int) -> ((Int, Int)) -> Pole {
    //                      ~~~~~~~~~~~~~~~~~~~~~
    return {
        (p:(Int, Int)) -> Pole in
        let (x, y) = p
        if y + n - x > 4 {
            return .Nothing
        }
        let r = (x , y + n)
        return .Just(r)
    }
}


let pole:Pole = monad((0, 0))
let result = pole >>= landLeft(3) >>= landRight(5) >>= landRight(1) >>= landLeft(6)
print(result)

let result2 = pole >>= landLeft(3) >>= landRight(4) >>= landRight(5) >>= landLeft(7)
print(result2)




