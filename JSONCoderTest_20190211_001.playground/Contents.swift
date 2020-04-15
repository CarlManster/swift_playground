import UIKit

extension JSONDecoder {
    static func decode<T: Decodable>(_ type: T.Type, string: String, encoding: String.Encoding = .utf8) -> T? {
        guard let stringData = string.data(using: .utf8) else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: stringData)
    }
}

extension JSONEncoder {
    static func encode<T: Encodable>(_ value: T, encoding: String.Encoding = .utf8, outputFormatting: JSONEncoder.OutputFormatting = []) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = outputFormatting
        
        guard let data = try? encoder.encode(value) else { return nil }

        return String(data: data, encoding: encoding)
    }
}

func decodeAndPrint<T: Decodable>(type: T.Type, string: String) {
    if let result = JSONDecoder.decode(T.self, string: string) {
        print("result == \(result)")
    } else {
        print("result decode failed")
    }
}

func encodeAndPrint<T: Encodable>(value: T) {
    if let result = JSONEncoder.encode(value, outputFormatting: .prettyPrinted) {
        print("result == \(result)")
    } else {
        print("result encode failed")
    }
}

struct Test: Codable {
    let hello: String?
    let time: Int
    let point: Double?
}

decodeAndPrint(type: Test.self, string: "{ \"hello\" : \"world\", \"time\": 1 }")
decodeAndPrint(type: Test.self, string: "{ \"time\": 3 }")
decodeAndPrint(type: Test.self, string: "{ \"hello\" : \"my friend\" }")

encodeAndPrint(value: Test(hello: "holy", time: 29, point: 10.0))
encodeAndPrint(value: Test(hello: "hi", time: 9, point: Double.infinity))





