//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var ActionBlockKey: UInt8 = 0

extension UIButton {
    func setAction(_ action: ((UIButton) -> Void)) {
        objc_setAssociatedObject(self, &ActionBlockKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(doBlockAction(_:)), for: .touchUpInside)
    }
    
    @objc func doBlockAction(_ sender: UIButton) {
        if let wrapper = objc_getAssociatedObject(self, &ActionBlockKey) as? ((UIButton) -> Void) {
            wrapper(sender)
        }
    }
}

class ContainerView: UIView {
    var lastIndex: Int = 0
    let fontSize: CGFloat = 17.0
    let xBasePos: CGFloat = 10.0
    let yBasePos: CGFloat = 5.0
    let baseHeight: CGFloat = 18.0
    let baseHeightMargin: CGFloat = 2.0
    let buttonWidth: CGFloat = 100.0
    
    @discardableResult
    func appendLabel(_ text: String, withFontWeight weight: UIFont.Weight) -> UILabel {
        let origin: CGPoint = CGPoint(x: xBasePos,
                                      y: yBasePos + (baseHeightMargin + baseHeight) * CGFloat(lastIndex))
        let size: CGSize = CGSize(width: self.frame.size.width, height: baseHeight)
        let rect: CGRect = CGRect(origin: origin, size: size)
        let label = UILabel(frame: rect)
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.text = text
        
        self.addSubview(label)
        
        lastIndex += 1
        
        return label
    }
    
    @discardableResult
    func appendButton(_ text: String, action: ((UIButton) -> Void)) -> UIButton {
        let origin: CGPoint = CGPoint(x: self.frame.size.width - (xBasePos + buttonWidth),
                                      y: yBasePos + (baseHeightMargin + baseHeight) * CGFloat(lastIndex - 1))
        let size: CGSize = CGSize(width: buttonWidth, height: baseHeight)
        let rect: CGRect = CGRect(origin: origin, size: size)
        let button = UIButton(frame: rect)
        button.backgroundColor = .clear
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 5.0
        button.setAction(action)
        
        self.addSubview(button)
        
        return button
    }
}

let containerView = ContainerView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 480)))
containerView.backgroundColor = .white

let label = containerView.appendLabel("regular", withFontWeight: .regular)

containerView.appendButton("change") { (button) in
    UIView.transition(with: label, duration: 0.25, options: .transitionCrossDissolve, animations: {
        if label.textColor == .orange {
            label.textColor = .black
        } else {
            label.textColor = .orange
        }
    }) { (result) in
        print("result == \(result)")
    }
}

PlaygroundPage.current.liveView = containerView




