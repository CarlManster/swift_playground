//: Playground - noun: a place where people can play

import UIKit


extension URL {
    static func url(string: String) -> URL? {
        if let url = URL(string: string) {
            return url
        }
        
        if let unwrappedString = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            return URL(string: unwrappedString)
        } else {
            return nil
        }
    }
    
    func queryDictionary() -> [AnyHashable : Any] {
        var resultDict: [AnyHashable : Any] = [:]
        
        if let queryString = self.query, queryString.isEmpty == false {
            for pairString in queryString.components(separatedBy: "&") {
                let pair = pairString.components(separatedBy: "=")
                
                if pair.count == 2 {
                    if let value = pair[1].removingPercentEncoding {
                        resultDict.updateValue(value, forKey: pair[0])
                    }
                }
            }
        }
        
        return resultDict
    }
    
    func fragmentDictionary() -> [AnyHashable : Any] {
        var resultDict: [AnyHashable : Any] = [:]
        
        if let fragmentString = self.fragment, fragmentString.isEmpty == false {
            for pairString in fragmentString.components(separatedBy: "&") {
                let pair = pairString.components(separatedBy: "=")
                
                if pair.count == 2 {
                    if let value = pair[1].removingPercentEncoding {
                        resultDict.updateValue(value, forKey: pair[0])
                    }
                }
            }
        }
        
        return resultDict
    }
}

let urlString = "http://m.search.ticketmonster.co.kr/search?focus=on&from=home#categoryName=%EC%A0%84%EC%B2%B4&keyword=%EC%98%81%EC%96%B4&searchType=ac&sort=popular&thr=ms&useTypoCorrection=true&workKeyword=%EC%98%81%EC%96%B4"


let url = URL(string: urlString)
let queryDict = url?.queryDictionary()
let fragmentDict = url?.fragmentDictionary()

if let queryDict = queryDict {
    print(queryDict)
}

if let fragmentDict = fragmentDict {
    print(fragmentDict)
}
