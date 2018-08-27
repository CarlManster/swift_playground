//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let contents: [UIColor]
 = [.red, .green] //, .blue, .darkGray, .magenta, .cyan, .yellow, .lightGray]

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 700.0, height: 700.0))

containerView.backgroundColor = .white

let stackView = UIStackView()
stackView.backgroundColor = .purple
stackView.clipsToBounds = true
stackView.translatesAutoresizingMaskIntoConstraints = false

containerView.addSubview(stackView)

var horizontal = true

if horizontal {
    stackView.axis = .horizontal
    stackView.distribution = .equalCentering
    stackView.alignment = .center
    stackView.spacing = 20.0
    
    containerView.addConstraint(stackView.centerXAnchor
        .constraint(equalTo: containerView.centerXAnchor))
    
} else {
    stackView.axis = .vertical
    stackView.distribution = .equalCentering
    stackView.alignment = .leading
    stackView.spacing = 0
    
    containerView.addConstraint(stackView.leadingAnchor
        .constraint(equalTo: containerView.leadingAnchor, constant: 5.0))
}

containerView.addConstraint(stackView.centerYAnchor
    .constraint(equalTo: containerView.centerYAnchor))


for (idx, color) in contents.enumerated() {
    let label = UILabel(frame: .zero)
    label.text = "view \(pow(10, idx))"
    label.textColor = color
    
    stackView.addArrangedSubview(label)
}

PlaygroundPage.current.liveView = containerView



