//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

extension UIView {
    func setTestBorder(color: UIColor) {
        
    }
}

class MarqueeLabel: UIView {
    private var internalLabel: UILabel
    private var isAnimating: Bool = false
    
    override init(frame: CGRect) {
        internalLabel = UILabel(frame: CGRect(origin: .zero, size: frame.size))
        internalLabel.numberOfLines = 1
        internalLabel.textAlignment = .center
        
        super.init(frame: frame)
        
        self.addSubview(internalLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBInspectable var speed: Double = 50.0
    @IBInspectable var sidePadding: CGFloat = 5.0
    
    @IBInspectable var text: String? {
        get {
            return internalLabel.text
        }
        set {
            internalLabel.text = newValue
            
            updateFrame()
        }
    }
    
    @IBInspectable var font: UIFont {
        get {
            return internalLabel.font
        }
        set {
            internalLabel.font = newValue
            
            updateFrame()
        }
    }
    
    private func updateFrame() {
        let newSize = internalLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: internalLabel.frame.size.height))
        
        internalLabel.frame = CGRect(origin: internalLabel.frame.origin, size: CGSize(width: newSize.width + (sidePadding * 2), height: newSize.height))
        
        startMarquee()
    }
    
    private var lengthGap: CGFloat {
        return (internalLabel.frame.size.width - self.frame.size.width)
    }
    
    private func forwardAnimating() {
        let length = lengthGap
        let duration: TimeInterval = Double(length) / speed
        
        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.internalLabel.frame = CGRect(origin: CGPoint(x: -length, y: 0.0), size: strongSelf.internalLabel.frame.size)
        }) { [weak self] (completed) in
            guard let strongSelf = self else { return }
            
            if strongSelf.isAnimating == true {
                strongSelf.backwardAnimating()
            }
        }
    }
    
    private func backwardAnimating() {
        let length = lengthGap
        let duration: TimeInterval = Double(length) / speed
        
        UIView.animate(withDuration: duration, animations: { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.internalLabel.frame = CGRect(origin: .zero, size: strongSelf.internalLabel.frame.size)
        }) { [weak self] (completed) in
            guard let strongSelf = self else { return }
            
            if strongSelf.isAnimating == true {
                strongSelf.forwardAnimating()
            }
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        print("self.superview == \(self.superview.debugDescription)")
        
        if self.superview == nil {
            stopMarquee()
        } else {
            startMarquee()
        }
    }
    
    private func startMarquee() {
        stopMarquee()
        
        print("lengthGap == \(lengthGap)")
        
        if lengthGap > 0.0 {
            isAnimating = true
            
            if internalLabel.frame.origin.x >= 0.0 {
                forwardAnimating()
            } else {
                backwardAnimating()
            }
        }
    }
    
    private func stopMarquee() {
        isAnimating = false
        self.layer.removeAllAnimations()
    }
}


let frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 800))

let baseView = UIView(frame: frame)
baseView.backgroundColor = .white

let marquee: MarqueeLabel = MarqueeLabel(frame: CGRect(origin: CGPoint(x: 0.0, y: 20.0), size: CGSize(width: 400, height: 30)))
marquee.text = "asdjflkjpajpwoejrpojqpowejrpjlklkjasldjfasdfasdfasdfasdfawerscxvbdfgaer"
marquee.font = UIFont.boldSystemFont(ofSize: 20.0)

baseView.addSubview(marquee)


let marquee2: MarqueeLabel = MarqueeLabel(frame: CGRect(origin: CGPoint(x: 0.0, y: 60.0), size: CGSize(width: 400, height: 30)))
marquee2.text = "asdfasdf"
marquee2.font = UIFont.boldSystemFont(ofSize: 20.0)

baseView.addSubview(marquee2)

Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
    marquee.text = "hello world"
}

PlaygroundPage.current.liveView = baseView
