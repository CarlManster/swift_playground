import UIKit
import PlaygroundSupport

final class GradientLabel: UIView {
    let gradientLayer = CAGradientLayer()
    let label = UILabel()
    
    convenience init() { self.init(frame: .zero) }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = bounds
        label.frame = bounds
        
        addSubview(label)
        
        mask = label
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
        label.frame = bounds
    }
}

final class MyViewController : UIViewController {
    private let label = GradientLabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 0.3, alpha: 0.7)

        view.addSubview(label)
        
        label.gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        label.gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        label.gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        label.label.text = "Hello World"
        label.label.backgroundColor = .clear
        label.label.font = UIFont.boldSystemFont(ofSize: 40)
        label.label.textAlignment = .center
        
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor]
        animation.toValue = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.red.cgColor]
        animation.duration = 3.0
        animation.repeatCount = HUGE
        animation.autoreverses = true
        animation.isRemovedOnCompletion = false
        
        label.gradientLayer.add(animation, forKey: "gradientLabel.colors")
    }
}

PlaygroundPage.current.liveView = MyViewController()
PlaygroundPage.current.needsIndefiniteExecution = true

