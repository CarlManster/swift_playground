//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello\nSwift playground\n동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세"
let range = NSRange(location: 0, length: Int(str.count))

var paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
paragraphStyle.paragraphSpacing = 10.0
paragraphStyle.lineBreakMode = .byWordWrapping
let font: UIFont = UIFont.systemFont(ofSize: 13.0, weight: .medium)

var attributedString: NSMutableAttributedString = NSMutableAttributedString(string: str)
attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: range)
//attributedString.addAttribute(NSAttributedStringKey.kern, value: 7.0, range: range)



let boundingRect = attributedString.boundingRect(with: CGSize(width: 100.0, height: 600.0),
                                                 options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
attributedString.enumerateAttributes(in: range, options: []) { (pair, rng, value) in
    print("pair == \(pair)")
}

let view: UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500.0, height: 800.0))
view.backgroundColor = .white

let label: UILabel = UILabel(frame: CGRect(origin: CGPoint(x: 20.0, y: 20.0), size: boundingRect.size))
label.layer.borderColor = UIColor.red.cgColor
label.layer.borderWidth = 1.0
label.numberOfLines = 0
label.attributedText = attributedString

view.addSubview(label)

PlaygroundPage.current.liveView = view
