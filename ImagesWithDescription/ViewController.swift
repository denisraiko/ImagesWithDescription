//
//  ViewController.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView = ImageView(imageName: "1")
    private let lastButton = Button(title: "Last", color: .blue, isShadow: true)
    private let nextButton = Button(title: "Next", color: .white, isShadow: true)
    private let firstButton = Button(title: "First", color: .red, isShadow: false)
    
    private let verticalStackView = UIStackView()
    private let horizontalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

