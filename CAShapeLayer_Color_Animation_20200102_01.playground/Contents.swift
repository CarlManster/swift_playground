import UIKit
import CoreFoundation
import PlaygroundSupport

extension CGColor {
    static var red: CGColor { UIColor.red.cgColor }
    static var orange: CGColor { UIColor.orange.cgColor }
    static var yellow: CGColor { UIColor.yellow.cgColor }
    static var green: CGColor { UIColor.green.cgColor }
    static var blue: CGColor { UIColor.blue.cgColor }
    static var indigo: CGColor { UIColor(red: 0.294, green: 0.0, blue: 0.51, alpha: 1.0).cgColor }
    static var purple: CGColor { UIColor(red: 0.502, green: 0.0, blue: 0.502, alpha: 1.00).cgColor }
}

extension CAShapeLayer {
    convenience public init(path: CGPath) {
        self.init()
        self.path = path
    }
}

extension UIView {
    func add(_ newLayer: CALayer) {
        layer.addSublayer(newLayer)
    }
}

final class MainViewController: UIViewController {
    static var shared: MainViewController? {
        return sharedNavigationController.viewControllers.first as? MainViewController
    }
    
    static let sharedNavigationController: UINavigationController = {
        let nc = UINavigationController(rootViewController: MainViewController())
        nc.navigationBar.isTranslucent = false
        return nc
    }()
    
    private let fillColors: [CGColor] = [ .red, .orange, .yellow, .green, .blue, .indigo, .purple ]
    private let strokeColors: [CGColor] = [ UIColor.black.cgColor, UIColor.lightGray.cgColor ]

    private let shapeLayer: CAShapeLayer = {
        let sl = CAShapeLayer(path: {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 100.0, y: 50.0))
            path.addLine(to: CGPoint(x: 200.0, y: 50.0))
            path.addLine(to: CGPoint(x: 250.0, y: 250.0))
            path.addArc(withCenter: CGPoint(x: 120.0, y: 240.0), radius: 50.0, startAngle: 0.0, endAngle: .pi / 2.0, clockwise: false)
            path.addLine(to: CGPoint(x: 80.0, y: 200.0))
            path.addLine(to: CGPoint(x: 60.0, y: 180.0))
            path.addLine(to: CGPoint(x: 280.0, y: 100.0))
            path.addLine(to: CGPoint(x: 100.0, y: 50.0))
            return path.cgPath
        }())
        sl.fillColor = .red
        sl.strokeColor = UIColor.black.cgColor
        return sl
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        view.add(shapeLayer)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Color Animation"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startAnimation()
    }
    
    private func startAnimation() {
        let fillColorAnimation = CAKeyframeAnimation(keyPath: "fillColor")
        fillColorAnimation.values = fillColors
        
        let strokeColorAnimation = CAKeyframeAnimation(keyPath: "strokeColor")
        strokeColorAnimation.values = strokeColors
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [ fillColorAnimation, strokeColorAnimation ]
        animationGroup.duration = 7.0
        animationGroup.repeatCount = HUGE
        animationGroup.isRemovedOnCompletion = false
        animationGroup.autoreverses = true
        
        self.shapeLayer.add(animationGroup, forKey: "animation.color.fill")
    }
}

PlaygroundPage.current.liveView = MainViewController.sharedNavigationController
