import UIKit

public class ContentViewRouter {
    public static func append(on baseViewController: UIViewController?, targetView: UIView?) {
        guard let baseViewController = baseViewController, let targetView = targetView else { return }
        
        let contentViewController = ContentViewController()
        let navigationController = UINavigationController(rootViewController: contentViewController)
        
        baseViewController.addChild(navigationController)
        targetView.addSubview(navigationController.view)
    }
}


class ContentViewController: UIViewController {
    private var button: UIButton!
    
    override func loadView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        button = UIButton(type: .custom)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 200, height: 30)
        button.setTitle("Press me!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onButtonClicked(_:)), for: .touchUpInside)
        button.isExclusiveTouch = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.red.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("bounds == \(view.bounds)")
        
        self.navigationController?.navigationBar.isTranslucent = false

        button.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let superView = view.superview {
            view.topAnchor.constraint(equalTo: superView.topAnchor, constant: 30.0).isActive = true
            view.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        }
    }
    
    @objc func onButtonClicked(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            NextContentViewRouter.open(on: navigationController)
        }
    }
}

