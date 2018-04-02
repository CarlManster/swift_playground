//: Playground - noun: a place where people can play

import UIKit

extension TimeInterval {
    var dhmsDuration: (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let toInt = Int(self)
        return (toInt / 86400, (toInt % 86400) / 3600, ((toInt % 86400) % 3600) / 60, (((toInt % 86400) % 3600) % 60))
    }
    
    var hmsDuration: (hours: Int, minutes: Int, seconds: Int) {
        let toInt = Int(self)
        return (toInt / 3600, (toInt % 3600) / 60, (toInt % 3600) % 60)
    }
    
    var hmsDurationString: String {
        let toHmsDuration = self.hmsDuration
        
        var result: String
        if toHmsDuration.hours > 0 {
            result = String(format: "%02d:%02d:%02d", toHmsDuration.hours, toHmsDuration.minutes, toHmsDuration.seconds)
        } else {
            result = String(format: "%02d:%02d", toHmsDuration.minutes, toHmsDuration.seconds)
        }
        
        return result
    }
    
    var hmsDroppedDurationString: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = [ .pad ]
        
        var result: String?
        
        if self < 3600 {
            formatter.allowedUnits = [ .minute, .second ]
            result = formatter.string(from: self)
        } else {
            formatter.allowedUnits = [ .hour, .minute, .second ]
            result = formatter.string(from: self)
        }
        
        return result ?? "0:00"
    }
}

var durations: [TimeInterval] = [0.0, 2.0, 10.0, 60.0, 75.0, 110.0, 230.0, 1800.0, 3645.0, 9300.0, 86430.0, 234234.0]

for duration in durations {
    let group = duration.hmsDuration
    
    if group.hours > 0 {
        print(String(format: "%02d:%02d:%02d", group.hours, group.minutes, group.seconds))
    } else {
        print(String(format: "%02d:%02d", group.minutes, group.seconds))
    }
    
}

