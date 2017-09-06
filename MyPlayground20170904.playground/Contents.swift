//: Playground - noun: a place where people can play

import UIKit

extension URL {
    func queryDictionary() -> [String : String] {
        var resultDict: [String : String] = [:]
        
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
    
    func fragmentDictionary() -> [String : String] {
        var resultDict: [String : String] = [:]
        
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
    
    private func generateBaseUrlString() -> String {
        var newUrl = ""
        
        // Scheme
        if let scheme = self.scheme, scheme.isEmpty == false {
            newUrl += "\(scheme)://"
        } else {
            newUrl += "http://"
        }
        
        // User
        if let user = self.user, user.isEmpty == false {
            newUrl += user
            
            // Password
            if let pass = self.password, pass.isEmpty == false {
                newUrl += ":\(pass)"
            }
        }
        
        // Host
        if let host = self.host, host.isEmpty == false {
            newUrl += host
        }
        
        // Port
        if let port = self.port, port > 0 {
            newUrl += ":\(port)"
        }
        
        // Path
        let path = self.path
        
        if path.isEmpty == false {
            newUrl += path
        }
        
        return newUrl
    }
}

