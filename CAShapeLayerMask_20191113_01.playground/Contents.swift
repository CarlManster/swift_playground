//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    private struct UIConstant {
        static let sliderMargin: CGFloat = 10.0
    }
    
    private let titleLabel: UILabel = UILabel()
    private let bgLayer: CALayer = CALayer()
    private let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    private var xCoordSlider: UISlider = UISlider()
    private var yCoordSlider: UISlider = UISlider()
    private var radiusSlider: UISlider = UISlider()
    private var barHeightSlider: UISlider = UISlider()
    
    var currentCenter: CGPoint = CGPoint(x: 160.0, y: 200.0)
    var currentRadius: CGFloat = 20.0
    var currentBarHeight: CGFloat = 50.0
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupTitleLabel()
        setupSliders(center: currentCenter, radius: currentRadius, barHeight: currentBarHeight)
        setupShapeLayer(center: currentCenter, radius: currentRadius, barHeight: currentBarHeight)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "CAShapeLayer Mask"
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 2.0).isActive = true
        
        titleLabel.sizeToFit()
    }
    
    private func setupBackground() {
        bgLayer.zPosition = 0.1
        bgLayer.backgroundColor = UIColor.orange.cgColor
        bgLayer.frame = view.bounds
        bgLayer.mask = shapeLayer

        view.layer.addSublayer(bgLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bgLayer.frame = view.bounds
    }
    
    private func setupSliders(center: CGPoint, radius: CGFloat, barHeight: CGFloat) {
        xCoordSlider.translatesAutoresizingMaskIntoConstraints = false
        yCoordSlider.translatesAutoresizingMaskIntoConstraints = false
        radiusSlider.translatesAutoresizingMaskIntoConstraints = false
        barHeightSlider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(xCoordSlider)
        view.addSubview(yCoordSlider)
        view.addSubview(radiusSlider)
        view.addSubview(barHeightSlider)
        
        barHeightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstant.sliderMargin).isActive = true
        barHeightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstant.sliderMargin).isActive = true
        barHeightSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIConstant.sliderMargin).isActive = true
        
        radiusSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstant.sliderMargin).isActive = true
        radiusSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstant.sliderMargin).isActive = true
        radiusSlider.bottomAnchor.constraint(equalTo: barHeightSlider.topAnchor, constant: -UIConstant.sliderMargin).isActive = true
        
        yCoordSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstant.sliderMargin).isActive = true
        yCoordSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstant.sliderMargin).isActive = true
        yCoordSlider.bottomAnchor.constraint(equalTo: radiusSlider.topAnchor, constant: -UIConstant.sliderMargin).isActive = true
        
        xCoordSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstant.sliderMargin).isActive = true
        xCoordSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstant.sliderMargin).isActive = true
        xCoordSlider.bottomAnchor.constraint(equalTo: yCoordSlider.topAnchor, constant: -UIConstant.sliderMargin).isActive = true

        xCoordSlider.minimumValue = Float(radius)
        xCoordSlider.maximumValue = Float(center.x * 2.0)
        xCoordSlider.value = Float(center.x)
        
        yCoordSlider.minimumValue = 100.0
        yCoordSlider.maximumValue = Float(center.y * 2.0)
        yCoordSlider.value = Float(center.y)
        
        radiusSlider.minimumValue = 1.0
        radiusSlider.maximumValue = Float(radius * 3.0)
        radiusSlider.value = Float(radius)
        
        barHeightSlider.minimumValue = 0.0
        barHeightSlider.maximumValue = Float(barHeight * 3.0)
        barHeightSlider.value = Float(barHeight)

        xCoordSlider.addTarget(self, action: #selector(xCoordValueChanged(_:)), for: .valueChanged)
        yCoordSlider.addTarget(self, action: #selector(yCoordValueChanged(_:)), for: .valueChanged)
        radiusSlider.addTarget(self, action: #selector(radiusValueChanged(_:)), for: .valueChanged)
        barHeightSlider.addTarget(self, action: #selector(barHeightValueChanged(_:)), for: .valueChanged)
    }
    
    private func setupShapeLayer(center: CGPoint, radius: CGFloat, barHeight: CGFloat) {
        let topArcCenter = CGPoint(x: center.x, y: center.y - (barHeight / 2.0))
        let bottomArcCenter = CGPoint(x: center.x, y: center.y + (barHeight / 2.0))
        
        let circlePath = UIBezierPath(arcCenter: topArcCenter, radius: radius, startAngle: 0.0, endAngle: CGFloat(Double.pi), clockwise: false)
        circlePath.addLine(to: CGPoint(x: topArcCenter.x - radius, y: topArcCenter.y + barHeight))
        circlePath.addArc(withCenter: bottomArcCenter, radius: radius, startAngle: CGFloat(Double.pi), endAngle: 0.0, clockwise: false)
        
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
    }
    
    @objc func xCoordValueChanged(_ slider: UISlider) {
        currentCenter = CGPoint(x: CGFloat(slider.value), y: currentCenter.y)
        
        setupShapeLayer(center: currentCenter, radius: currentRadius, barHeight: currentBarHeight)
    }
    
    @objc func yCoordValueChanged(_ slider: UISlider) {
        currentCenter = CGPoint(x: currentCenter.x, y: CGFloat(slider.value))
        
        setupShapeLayer(center: currentCenter, radius: currentRadius, barHeight: currentBarHeight)
    }
    
    @objc func radiusValueChanged(_ slider: UISlider) {
        currentRadius = CGFloat(slider.value)
        
        setupShapeLayer(center: currentCenter, radius: currentRadius, barHeight: currentBarHeight)
    }
    
    @objc func barHeightValueChanged(_ slider: UISlider) {
        currentBarHeight = CGFloat(slider.value)
        
        setupShapeLayer(center: currentCenter, radius: currentRadius, barHeight: currentBarHeight)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
