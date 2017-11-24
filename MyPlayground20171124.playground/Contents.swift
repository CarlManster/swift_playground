//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ContainerView: UIView {
    var lastIndex: Int = 0
    let fontSize: CGFloat = 17.0
    let xBasePos: CGFloat = 10.0
    let yBasePos: CGFloat = 5.0
    
    @discardableResult
    func appendLabel(_ text: String, withFontWeight weight: UIFont.Weight) -> UILabel {
        let origin: CGPoint = CGPoint(x: xBasePos, y: yBasePos + 20.0 * CGFloat(lastIndex))
        let size: CGSize = CGSize(width: self.frame.size.width, height: 18.0)
        let rect: CGRect = CGRect(origin: origin, size: size)
        let label = UILabel(frame: rect)
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.text = text
        
        self.addSubview(label)
        
        lastIndex += 1
        
        return label
    }
}

let containerView = ContainerView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 480)))
containerView.backgroundColor = .white

containerView.appendLabel("ultraLight", withFontWeight: .ultraLight)
containerView.appendLabel("thin", withFontWeight: .thin)
containerView.appendLabel("light", withFontWeight: .light)
containerView.appendLabel("regular", withFontWeight: .regular)
containerView.appendLabel("medium", withFontWeight: .medium)
containerView.appendLabel("semibold", withFontWeight: .semibold)
containerView.appendLabel("bold", withFontWeight: .bold)
containerView.appendLabel("heavy", withFontWeight: .heavy)
containerView.appendLabel("black", withFontWeight: .black)

PlaygroundPage.current.liveView = containerView
