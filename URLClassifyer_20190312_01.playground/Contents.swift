import UIKit

extension URL {
    var queries: [AnyHashable: Any] {
        var result: [AnyHashable: Any] = [:]
        
        if let queryItems = self.query?.components(separatedBy: "&") {
            for query in queryItems {
                let pair = query.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
                
                if pair.count == 2, let value = pair[1].removingPercentEncoding {
                    result["\(pair[0])"] = "\(value.removingPercentEncoding ?? value)"
                }
            }
        }
        
        return result
    }
}
struct LaunchTarget {
    enum Referrer {
        case scheme(String?)
        case push(String?)
        case other(String?)
    }
    
    enum Screen: String {
        #warning("screen names are temporary... should be fixed")
        case launch
        case poi
        case navi
        case musicList
        case musicPlayer
        case radiko
    }
    
    enum Action: String {
        #warning("action names are temporary... should be fixed")
        case noAction
        case setBirthday
    }
    
    let origin: Referrer // Reserved for trackers (GA, Nelo, etc)
    var screens: [Screen] = []
    var action: Action = .noAction
    var parameters: [AnyHashable: Any] = [:]
    
    init(origin: Referrer) {
        self.origin = origin
    }
}

extension LaunchTarget {
    // Scheme - URL String
    static func parse(urlString: String) -> LaunchTarget? {
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString) else {
            return nil
        }
        
        return parse(url: url)
    }
    
    // Scheme - URL Object
    static func parse(url: URL) -> LaunchTarget? {
        var target = LaunchTarget(origin: .scheme(url.absoluteString))
        if target.parse(url: url) {
            return target
        }
        return nil
    }
    
    // Notification
    static func parse(notification: [AnyHashable: Any]) -> LaunchTarget? {
        guard let userInfo = notification["userInfo"] as? [AnyHashable: Any],
            let landing = userInfo["landing"] as? String,
            let url = URL(string: landing.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? landing) else {
                return nil
        }
        
        var target = LaunchTarget(origin: .push(url.absoluteString))
        if target.parse(url: url) {
            return target
        }
        return nil
    }
    
    // URL scheme format: https://wiki.linecorp.com/display/JTF/Clova+Auto+App+Scheme+specifications
    private mutating func parse(url: URL) -> Bool {
        guard url.scheme == "lineclovaauto" else {
            return false
        }
        
        if let host = url.host {
            let hostSplit = host.components(separatedBy: ".")
            
            for screen in hostSplit {
                if let screenItem = LaunchTarget.Screen(rawValue: screen) {
                    screens.append(screenItem)
                }
            }
        }
        
        for path in url.pathComponents {
            if let action = LaunchTarget.Action(rawValue: path) {
                self.action = action
            }
        }
        
        for query in url.queries {
            parameters[query.key] = query.value
        }
        
        return true
    }
}

func parse(string: String) {
    print("string == \(string)")
    if let target = LaunchTarget.parse(urlString: string) {
        print("\torigin == \(target.origin)")
        print("\tscreen == \(target.screens)")
        print("\taction == \(target.action)")
        print("\tparameters == \(target.parameters)")
    }
}

let list = [
    "lineclovaauto://navi.poi/ko/kr/seongnam/223672/march-weather/223672?monyr=3/1/2019",
    "lineclovaauto://musicList/setBirthday?name=carl",
    "lineclovaauto://the/",
    "lineclovaauto://",
    "lineclovaauto://it.be.parsed/?url=http://www.accuweather.com?monyr=3/1/2019",
    "lineclovaauto://can.it.be.parsed/?oh=&no=",
    "lineclovaauto:/really?",
    "lineclovaauto://you.parse/한국어?word=안녕하세요",
    "lineclovaauto://japanese/こんにちは?word=そですね",
    "lineclovaauto://hello?word=%EC%95%88%EB%85%95%ED%95%98%EC%84%B8%EC%9A%94",
    "lineclovaauto://launch"
]

//for str in list {
//    parse(string: str)
//}

//let result: (String) -> Bool = { (latest) in
//    return ("0.0.2".compare(latest, options: .numeric) == .orderedAscending)
//}
//
//result("0.0.1")
//result("0.0.11")
//result("0.2.0")
//result("1.0.1")
//result("1.0.1")
