import UIKit

public class NextContentViewRouter {
    public static func open(on navigationController: UINavigationController?) {
        navigationController?.pushViewController(NextContentViewController(), animated: true)
    }
}

class NextContentViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        
        self.view = view
    }
}

