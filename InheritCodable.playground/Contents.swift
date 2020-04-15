import UIKit

var str = "Hello, playground"

//class BaseClass: Codable { }
//
//class InheritedClass: BaseClass {
//    enum CodingKeys: String, CodingKey {
//        case hello
//    }
//
//    let hello: String
//
//    init(_ value: String) {
//        hello = value
//
//        super.init()
//    }
//
//    override func encode(to encoder: Encoder) throws {
//        try super.encode(to: encoder)
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.hello, forKey: .hello)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        hello = try container.decodeIfPresent(String.self, forKey: .hello) ?? ""
//
//        try super.init(from: decoder)
//    }
//}
//
//let instanceBase: BaseClass = InheritedClass("wow")
//let instanceInherit = InheritedClass("yep")
//
//if let data = try? JSONEncoder().encode(instanceBase) {
//    print("data == \(String(data: data, encoding: .utf8) ?? "failed") ")
//} else {
//    print("encode failed")
//}
//
//if let data = try? JSONEncoder().encode(instanceInherit) {
//    print("data == \(String(data: data, encoding: .utf8) ?? "failed") ")
//} else {
//    print("encode failed")
//}
//
//let one: Double = 1.0
//let two: Double = 1.00000000000000000000001
//
//let result = (fabs(one - two) < .ulpOfOne)

let strr = "%E6%93%8D%E4%BD%9C%E3%82%92%E5%AE%8C%E4%BA%86%E3%81%A7%E3%81%8D%E3%81%BE%E3%81%9B%E3%82%93%E3%81%A7%E3%81%97%E3%81%9F%E3%80%82%EF%BC%88NLChannelGatewayErrorDomain%E3%82%A8%E3%83%A9%E3%83%BC102%EF%BC%89"

print(strr.removingPercentEncoding)

