//
//  Button.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import Foundation
import UIKit

protocol IButtonDelegate: AnyObject {
    func pressedButton()
}

class Button: UIButton {
    var isShadow = true
    weak var delegate: IButtonDelegate?
    var nameInstance: String?
    
    init(title: String, color: UIColor, titleColor: UIColor, isShadow: Bool) {
        super.init(frame: .zero)
        setupButton(title: title, color: color, titleColor: titleColor, isShadow: isShadow)
        if isShadow {
            addShadowButton()
        }
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(title: String, color: UIColor, titleColor: UIColor, isShadow: Bool) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        layer.cornerRadius = 15
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
}

extension Button {
    private func addAction() {
        let action = UIAction { [weak self] _ in
            self?.delegate?.pressedButton()
        }
        addAction(action, for: .touchUpInside)
    }
}
