//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let width: CGFloat = 400
let height: CGFloat = 400

extension UIColor {
    convenience init(_ hex6: UInt32) {
        let divisor = CGFloat(255)
        let red = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hex6 & 0x00FF00) >> 8) / divisor
        let blue = CGFloat((hex6 & 0x0000FF) >> 0) / divisor
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

class FibonacciSpinner: UIView {
    var colors = [
        UIColor(0xee1c27),UIColor(0xbc0271),UIColor(0x612d92),UIColor(0x283897),
        UIColor(0x016db8),UIColor(0x02a2b8),UIColor(0x00a666),UIColor(0xa7d04e),
        UIColor(0xfef200),UIColor(0xfeaf16),UIColor(0xf58020),UIColor(0xf35724)]
    
    fileprivate var startIndex = 3
    
    var isCircular = false
    var numberOfBalls = 12
    var speed: Double = 0.5
    var limitCount = -1
    
    fileprivate var timeStep: Int = 0
    fileprivate var radius: CGFloat = 0
    fileprivate var displayLink: CADisplayLink?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        radius = min(frame.width, frame.height) / 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        frame.size.width = width
        frame.size.height = height
        
        radius = min(frame.width, frame.height) / 3
    }
    
    func startAnimating() {
        displayLink = UIScreen.main.displayLink(withTarget: self, selector: #selector(FibonacciSpinner.animateBalls))
        displayLink?.add(to: .current, forMode: .defaultRunLoopMode)
    }
    
    func stopAnimating() {
        displayLink?.invalidate()
        timeStep = 0
    }
    
    func clear() {
        layer.sublayers?.removeAll()
    }
    
    func drawBall(_ x: CGFloat, _ y: CGFloat, _ color: UIColor) {
        let dot = CAShapeLayer()
        dot.path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: 5, height: 5)).cgPath
        dot.fillColor = color.cgColor
        dot.strokeColor = UIColor.clear.cgColor
        dot.lineWidth = 0
        layer.addSublayer(dot)
    }
    
    func animateBalls() {
        clear()
        
        for i in startIndex ..< numberOfBalls + startIndex {
            drawBall(getX(i: i, timeStep: timeStep), getY(i: i, timeStep: timeStep), colors[i-startIndex])
        }
        
        if limitCount > 0, timeStep >= limitCount {
            stopAnimating()
        } else {
            timeStep += 1
        }
    }
    
    func getR(i: Int) -> CGFloat {
        return CGFloat((CGFloat(1+i) / CGFloat(numberOfBalls)) * radius)
    }
    
    func getT(i: Int, timeStep: Int) -> Double {
        return Double(timeStep) * (Double(i) / 100 * speed + 0.005)
    }
    
    func getX(i: Int, timeStep: Int) -> CGFloat {
        return (frame.width / 2) + CGFloat(getR(i: i)) * cos(CGFloat(getT(i: i, timeStep: timeStep)))
    }
    
    func getY(i: Int, timeStep: Int) -> CGFloat {
        if isCircular {
            return (frame.height / 2) + CGFloat(getR(i: i)) * sin(CGFloat(getT(i: i, timeStep: timeStep)))
        } else {
            return frame.height / 2
        }
    }
}



let origin = CGPoint(x: 0, y: 0)
let size = CGSize(width: width, height: height)
let rect = CGRect(origin: origin, size: size)
let view = FibonacciSpinner(frame: rect)
view.backgroundColor = UIColor.white
view.isCircular = true
view.limitCount = 2000

PlaygroundPage.current.liveView = view

view.startAnimating()



