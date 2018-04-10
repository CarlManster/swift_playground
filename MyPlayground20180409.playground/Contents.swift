//: Playground - noun: a place where people can play

import UIKit

extension Calendar {
    static var `default`: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "ko_KR")
        return calendar
    }
}

extension Date {
    var year: Int {
        return Calendar.default.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.default.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.default.component(.day, from: self)
    }
}

extension DateFormatter {
    static var current: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"
        return formatter
    }
}


// Dates
let now = Date()
let startOfDay = Calendar.default.startOfDay(for: now)
let oldTime = Date(timeIntervalSince1970: 812323244)

// Formatted Date String
let formattedNow = DateFormatter.current.string(from: now)
let formattedToday = DateFormatter.current.string(from: startOfDay)
let formattedOldTime = DateFormatter.current.string(from: oldTime)

print("now == \(now)")
print("now formatted == \(formattedNow)")
print("now year == \(now.year)")
print("now month == \(now.month)")
print("now day == \(now.day)")

print("today == \(startOfDay)")
print("today formatted == \(formattedToday)")
print("today year == \(startOfDay.year)")
print("today month == \(startOfDay.month)")
print("today day == \(startOfDay.day)")

print("oldTime == \(oldTime)")
print("oldTime formatted == \(formattedOldTime)")
print("oldTime year == \(oldTime.year)")
print("oldTime month == \(oldTime.month)")
print("oldTime day == \(oldTime.day)")


