import UIKit
import Combine

//var str = "Hello, playground"

let input = stride(from: 0, to: 1000, by: 1)

Publishers.Sequence<StrideTo<Int>, Error>(sequence: input)
    .filter { $0 % 3 == 1 }
    .map { ($0, $0 * 2) }
    .sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished:
            print("completion == finished")
        case .failure(let error):
            print("completion == failed \(error.localizedDescription)")
        }
    }, receiveValue: { (value) in
        print("value ==> \(value.0) x 2 = \(value.1)")
    })
