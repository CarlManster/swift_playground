//: Playground - noun: a place where people can play

import UIKit

extension String {
    func lastSubString(_ length: Int) -> String {
        if length > 0 {
            if self.count > length {
                let idxStart = self.index(self.endIndex, offsetBy: -length)
                let idxEnd = self.endIndex
                
                let subString = self[idxStart..<idxEnd]
                return String(subString)
            }
            
            return self
        }
        
        return ""
    }
    
    func frontMarked(_ markLength: Int) -> String {
        let seq: String = self[self.startIndex..<self.endIndex].enumerated().map {
            if $0.offset < markLength {
                return "*"
            } else {
                return String($0.element)
            }
            }.reduce("") { $0+$1 }
        
        return seq
    }
    
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
}

var str = "Hello, playground"
var strr = "오늘 하루 활기차게 보내세요"
var pathName = "/Users/user/Desktop/Workspace/w1-iOS/WatchOne/Dashboard/DashboardTableViewModel.swift"
var simplePath = "/"
var noPath = ""
let url = URL(string: "https://aki-dv.nlabscorp.com/blob/2018-voice/TYNBAC1dldJ0FwoJ.mp3?bitrate=100&pcm=1#fragment")

str.lastSubString(7)
strr.lastSubString(5)
strr.frontMarked(7)

pathName.lastPathComponent
simplePath.lastPathComponent
noPath.lastPathComponent
if let path = url?.path as NSString? {
    print(path.pathExtension)
}

let prevent: (String) -> String = { (time: String) in
    if time.count == 4, time.hasPrefix("24") {
        return "00\(time.lastSubString(2))"
    }
    
    return time
}

let formatter = DateFormatter()
formatter.dateFormat = "HHmm"
let timeStr = "2430"
let result = prevent(timeStr)

let date = formatter.date(from: result)
