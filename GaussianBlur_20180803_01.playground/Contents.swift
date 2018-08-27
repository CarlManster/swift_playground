//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class MyVisualEffectView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    var effect: UIVisualEffect? {
        didSet {
            if let effect = effect {
                self.applyEffect(effect)
            }
        }
    }
    
    var level: CGFloat = 0 {
        didSet {
            self.blurAnimator?.fractionComplete = level
        }
    }
    
    //  MARK: - private
    private let blurView = UIVisualEffectView()
    private var blurAnimator: UIViewPropertyAnimator?
    
    private func setup() {
        self.addSubview(self.blurView)
        self.blurView.frame = self.bounds
        self.blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func updateEffect() {
        if let effect = self.effect {
            self.applyEffect(effect)
        }
    }
    
    private func applyEffect(_ effect: UIVisualEffect) {
        let blurAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            self.blurView.effect = effect
        })
        blurAnimator.pauseAnimation()
        blurAnimator.fractionComplete = level
        self.blurAnimator = blurAnimator
    }
}

extension UIView {
    func setTestBorder(with color: UIColor = .red) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1.0
    }
    
    func blur(with radius: CGFloat) {
        guard superview != nil, let blur = CIFilter(name: "CIGaussianBlur") else {
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, 1)
        
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
        }
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            
            blur.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            blur.setValue(radius, forKey: kCIInputRadiusKey)
            
            let ciContext = CIContext(options: nil)
            
            let boundingRect = CGRect(origin: .zero, size: frame.size)
            
            if let result = blur.value(forKey: kCIOutputImageKey) as? CIImage,
                let cgImage = ciContext.createCGImage(result, from: boundingRect) {
                
                let filteredImage = UIImage(cgImage: cgImage)
                
                let blurOverlay = UIImageView()
                blurOverlay.frame = boundingRect
                
                blurOverlay.image = filteredImage
                blurOverlay.contentMode = .left
                
                if let superview = superview as? UIStackView,
                    let index = (superview as UIStackView).arrangedSubviews.index(of: self) {
                    removeFromSuperview()
                    superview.insertArrangedSubview(blurOverlay, at: index)
                } else {
                    blurOverlay.frame.origin = frame.origin
                    
                    UIView.transition(from: self, to: blurOverlay, duration: 0.2, options: .curveEaseIn, completion: nil)
                }
                
                objc_setAssociatedObject(self, &BlurableKey.blurable, blurOverlay, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        } else {
            UIGraphicsEndImageContext()
        }
    }
    
    func unBlur() {
        guard let blurOverlay = objc_getAssociatedObject(self, &BlurableKey.blurable) as? UIImageView else {
            return
        }
        
        if let superview = blurOverlay.superview as? UIStackView,
            let index = (blurOverlay.superview as! UIStackView).arrangedSubviews.index(of: blurOverlay) {
            blurOverlay.removeFromSuperview()
            superview.insertArrangedSubview(self, at: index)
        } else {
            frame.origin = blurOverlay.frame.origin
            
            UIView.transition(from: blurOverlay, to: self, duration: 0.2, options: .curveEaseIn, completion: nil)
        }
        
        objc_setAssociatedObject(self, &BlurableKey.blurable, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    var isBlurred: Bool {
        return objc_getAssociatedObject(self, &BlurableKey.blurable) is UIImageView
    }
}

struct BlurableKey {
    static var blurable = "blurable"
}

let image = UIImage(named: "rainy.jpg")

let imageView = UIImageView(image: image)
imageView.contentMode = .scaleAspectFit

let blurView = MyVisualEffectView(frame: .zero)
let gaussianView = UIView(frame: .zero)

let baseView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 500)))

baseView.backgroundColor = .white

baseView.addSubview(imageView)
baseView.addSubview(blurView)
baseView.addSubview(gaussianView)

imageView.translatesAutoresizingMaskIntoConstraints = false
blurView.translatesAutoresizingMaskIntoConstraints = false
gaussianView.translatesAutoresizingMaskIntoConstraints = false

let views = [ "imageView" : imageView, "blurView" : blurView, "gaussianView" : gaussianView ]

NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[imageView]-0-|", options: [], metrics: nil, views: views))
NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imageView]-0-|", options: [], metrics: nil, views: views))

NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[blurView(300)]", options: [], metrics: nil, views: views))
NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[blurView]-0-|", options: [], metrics: nil, views: views))

NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[gaussianView(100)]-0-|", options: [], metrics: nil, views: views))
NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[gaussianView]-0-|", options: [], metrics: nil, views: views))

blurView.effect = UIBlurEffect(style: .regular)
blurView.level = 0.2

imageView.blur(with: 20.0)

PlaygroundPage.current.liveView = baseView
