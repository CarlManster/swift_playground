//: Playground - noun: a place where people can play

import UIKit

func call<Input, Output>(_ function: (Input) -> Output, with input: Input) -> Output {
    return function(input)
}

class HeaderView: UIView {
    init(font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PromotionView: UIView {
    init(font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ProfileView: UIView {
    init(font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let styles = (UIFont.systemFont(ofSize: 20.0, weight: .medium), UIColor.green)

let headerView = call(HeaderView.init, with: styles)
let promotionView = call(PromotionView.init, with: styles)
let profileView = call(ProfileView.init, with: styles)
