//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// Present the view controller in the Live View window
let bundle = Bundle(for: RootViewController.self)
print("bundle == \(bundle.bundlePath)")
print("bundle.main == \(Bundle.main.bundlePath)")



if let rootViewController = UIStoryboard(name: "Root", bundle: bundle).instantiateInitialViewController() {
    
    print("Main loaded == \(rootViewController), \(rootViewController is RootViewController)")
    
    PlaygroundPage.current.liveView = rootViewController
}
