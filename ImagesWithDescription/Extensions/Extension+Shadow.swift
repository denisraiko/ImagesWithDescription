//
//  Extension+Shadow.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import Foundation
import UIKit

extension UIButton {
    func addShadowButton() {
        layer.cornerRadius = 15
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.borderColor = UIColor.black.cgColor
    }
}

extension UIView {
    func addShadowView() {
        layer.cornerRadius = 15
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.borderColor = UIColor.black.cgColor
    }
}
