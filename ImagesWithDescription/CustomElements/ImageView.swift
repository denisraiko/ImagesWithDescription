//
//  ImageView.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import Foundation
import UIKit

class ImageView: UIView {
    let imageView = UIImageView()
    
    init(imageName: String) {
        super.init(frame: .zero)
        setupImageView(imageName: imageName)
        imageView.addShadowView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView(imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        addSubview(imageView)
    }
    
    func updateImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}
