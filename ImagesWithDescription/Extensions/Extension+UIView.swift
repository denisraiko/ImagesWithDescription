//
//  Extension+UIView.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 13.02.25.
//

import Foundation
import UIKit


extension UIView {
    func countOfButton(_ views: UIView...) -> Int {
        var count = 0
        for view in views {
            if view is UIButton {
                count += 1
            }
        }
        return count
    }
    
    func nameOfButton(_ names: UIView...) {
        for name in names {
            guard let nameButton = name as? Button else { return }
            print(nameButton.nameInstance ?? "Unowned name")
        }
    }
}
