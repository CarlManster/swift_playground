//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"

extension Date {
    func daysListTo(date: Date) -> [(date: Date, description: String)] {
        var dates: [(Date, String)] = []
        
        let range: (from: Date, to: Date) = (min(self, date), max(self, date))
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let calendar = Calendar.current
        
        if let start = calendar.ordinality(of: .day, in: .era, for: range.from),
            let end = calendar.ordinality(of: .day, in: .era, for: range.to) {
            
            for day in ((start - start)...(end - start)) {
                if let date = calendar.date(byAdding: .day, value: day, to: range.from),
                    let trimmed = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: date)) {
                    let strDate = dateFormatter.string(from: trimmed)
                    dates.append((trimmed, strDate))
                }
            }
        }
        
        return dates
    }
}

class PickerViewDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    static let shared = PickerViewDataSource()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "Hello"
        } else {
            return "World"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let title = self.pickerView(pickerView, titleForRow: row, forComponent: component)
        
        print("row == \(row), component == \(component), title == \(title ?? "")")
        
        
    }
}

let baseView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 500.0, height: 800.0)))

baseView.backgroundColor = .white

// Date Picker
let datePicker = UIDatePicker(frame: .zero)
datePicker.layer.borderColor = UIColor.red.cgColor
datePicker.layer.borderWidth = 1.0

datePicker.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
datePicker.locale = Locale(identifier: "ko_KR")
datePicker.datePickerMode = .date

datePicker.frame = CGRect(origin: .zero, size: CGSize(width: baseView.frame.size.width, height: (baseView.frame.size.height / 2.0)) )

baseView.addSubview(datePicker)

print("\(datePicker.frame.size.width), \(datePicker.frame.size.height)")


// Picker
let commonPicker = UIPickerView(frame: .zero)
commonPicker.layer.borderColor = UIColor.green.cgColor
commonPicker.layer.borderWidth = 1.0

commonPicker.showsSelectionIndicator = true
commonPicker.dataSource = PickerViewDataSource.shared
commonPicker.delegate = PickerViewDataSource.shared

commonPicker.frame = CGRect(origin: CGPoint(x: 0.0, y: datePicker.frame.size.height), size: CGSize(width: baseView.frame.size.width, height: (baseView.frame.size.height / 2.0)))

baseView.addSubview(commonPicker)

PlaygroundPage.current.liveView = baseView

let date = Date()
let result1 = date.daysListTo(date: Date().addingTimeInterval(864000))
let result2 = date.daysListTo(date: Date().addingTimeInterval(-864000))
let result3 = date.daysListTo(date: date)
print("result1 == \(result1 as AnyObject)")
print("result2 == \(result2 as AnyObject)")
print("result3 == \(result3 as AnyObject)")
