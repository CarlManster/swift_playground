import UIKit

// Mark: - Base
protocol LocalizeKey {
    typealias Attributes = [NSAttributedString.Key : Any]
    
    var rawValue: String { get }
    var string: String { get }
    
    var attributes: Attributes? { get }
    var state: UIControl.State { get }
}

extension LocalizeKey {
    var string: String {
        return NSLocalizedString(rawValue, comment: rawValue)
    }
    
    var attributes: Attributes? {
        return nil
    }
    
    var state: UIControl.State {
        return .normal
    }
}

protocol Localizable {
    typealias Attributes = [NSAttributedString.Key : Any]
    
    func setLocalizable(key: LocalizeKey)
}

@propertyWrapper
struct Localized<T: Localizable> {
    private let key: LocalizeKey
    
    var wrappedValue: T? = nil {
        didSet {
            wrappedValue?.setLocalizable(key: key)
        }
    }
    
    init(_ key: LocalizeKey) {
        self.key = key
    }
}

extension UIButton: Localizable {
    func setLocalizable(key: LocalizeKey) {
        if let attributes = key.attributes, attributes.count > 0 {
            setAttributedTitle(NSAttributedString(string: key.string, attributes: attributes), for: key.state)
        } else {
            setTitle(key.string, for: state)
        }
    }
}

extension UILabel: Localizable {
    func setLocalizable(key: LocalizeKey) {
        if let attributes = key.attributes, attributes.count > 0 {
            attributedText = NSAttributedString(string: key.string, attributes: attributes)
        } else {
            text = key.string
        }
    }
}

extension UITextView: Localizable {
    func setLocalizable(key: LocalizeKey) {
        if let attributes = key.attributes, attributes.count > 0 {
            attributedText = NSAttributedString(string: key.string, attributes: attributes)
        } else {
            text = key.string
        }
    }
}

extension UITextField: Localizable {
    func setLocalizable(key: LocalizeKey) {
        if let attributes = key.attributes, attributes.count > 0 {
            attributedText = NSAttributedString(string: key.string, attributes: attributes)
        } else {
            text = key.string
        }
    }
}

// Mark: - Example
enum MyLocalizeKey: String, LocalizeKey {
    case labelTitle = "label_title"
    case buttonTitle = "button_title"
    
    var attributes: Attributes? {
        switch self {
        case .labelTitle:
            return nil
        case .buttonTitle:
            return [.font: UIFont.boldSystemFont(ofSize: 20.0)]
        }
    }
    
    var state: UIControl.State {
        switch self {
        case .buttonTitle:
            return .normal
        default:
            return .normal
        }
    }
}

class TestLocalized {
    @Localized(MyLocalizeKey.labelTitle)
    private var label: UILabel!
    
    @Localized(MyLocalizeKey.buttonTitle)
    private var button: UIButton!
    
    init() {
        label = UILabel()
        button = UIButton()
    }
    
    func showResult() {
        print("label == \(label.attributedText?.string ?? label.text ?? "Error")")
        print("button == \(button.attributedTitle(for: .normal)?.string ?? button.title(for: .normal) ?? "Error")")
    }
}

let test = TestLocalized()
test.showResult()
