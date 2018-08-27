//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(max(0, min(255, red))) / 255.0,
                  green: CGFloat(max(0, min(255, green))) / 255.0,
                  blue: CGFloat(max(0, min(255, blue))) / 255.0,
                  alpha: alpha)
    }
    
    convenience init(rgba: Int) {
        self.init(red: (rgba >> 24) & 0xFF,
                  green: (rgba >> 16) & 0xFF,
                  blue: (rgba >> 8) & 0xFF,
                  alpha: (CGFloat(rgba & 0xFF) / 255.0))
    }
    
    convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        self.init(red: (rgb >> 16) & 0xFF,
                  green: (rgb >> 8) & 0xFF,
                  blue: rgb & 0xFF,
                  alpha: alpha)
    }
}

class DragView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapAction(_ recognizer: UITapGestureRecognizer) {
        print("recognizer == \(recognizer)")
        
        let point = recognizer.location(in: self)
        
        print("tap point == \(point)")
    }
    
    @objc private func panAction(_ recognizer: UIPanGestureRecognizer) {
        print("recognizer == \(recognizer)")
        
        let point = recognizer.location(in: self)
        
        print("pan point == \(point)")
    }
}

let baseView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 600.0, height: 700.0)))
baseView.backgroundColor = .white

// Color Status View
let colorStatusView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10.0, height: 10.0)))
colorStatusView.backgroundColor = .red

baseView.addSubview(colorStatusView)

colorStatusView.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    colorStatusView.topAnchor
        .constraint(equalTo: baseView.topAnchor, constant: 10.0),
    colorStatusView.leadingAnchor
        .constraint(equalTo: baseView.leadingAnchor, constant: 10.0),
    colorStatusView.trailingAnchor
        .constraint(equalTo: baseView.trailingAnchor, constant: -10.0),
    colorStatusView.heightAnchor
        .constraint(equalToConstant: 100.0) ])

// DragView
let dragView = DragView(frame: CGRect(origin: .zero, size: CGSize(width: 10.0, height: 10.0)))
dragView.backgroundColor = .green

baseView.addSubview(dragView)

dragView.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    dragView.topAnchor
        .constraint(equalTo: colorStatusView.bottomAnchor, constant: 10.0),
    dragView.leadingAnchor
        .constraint(equalTo: baseView.leadingAnchor, constant: 10.0),
    dragView.trailingAnchor
        .constraint(equalTo: baseView.trailingAnchor, constant: -10.0),
    dragView.heightAnchor
        .constraint(equalToConstant: 100.0) ])




PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = baseView
