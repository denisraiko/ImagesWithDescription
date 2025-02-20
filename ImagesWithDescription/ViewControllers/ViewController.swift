//
//  ViewController.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView = ImageView(imageName: "1")
    private let lastButton = Button(title: "Last", color: .blue, titleColor: .white, isShadow: true)
    private let nextButton = Button(title: "Next", color: .white, titleColor: .black, isShadow: true)
    private let firstButton = Button(title: "First", color: .red, titleColor: .white, isShadow: false)
    
    private let verticalStackView = UIStackView()
    private let horizontalStackView = UIStackView()
    
    private let descriptionLabel = UILabel()
    
    private let imageManager = ImageManager()
    private let imageDataManager: ImageDataManager
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.imageDataManager = ImageDataManager(images: imageManager.getImages())
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.imageDataManager = ImageDataManager(images: imageManager.getImages())
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.delegate = self
        
        view.backgroundColor = .white
        setupDescriptionLabel()
        setupVerticalStackView()
        setupHorizontalStackView()
        view.addSubview(verticalStackView)
        view.addSubview(horizontalStackView)
        view.addSubview(firstButton)

        setupLayout()
        addAction()
        
        lastButton.nameInstance = "Last button"
        nextButton.nameInstance = "Next button"
        firstButton.nameInstance = "First button"
        
        print(view.countOfButton(firstButton, nextButton, lastButton))
        view.nameOfButton(firstButton, nextButton , lastButton)
        
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textAlignment = .center
    }
    
    private func setupVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20
        verticalStackView.alignment = .center
        verticalStackView.distribution = .equalSpacing
        
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 20
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .equalSpacing
        
        horizontalStackView.addArrangedSubview(lastButton)
        horizontalStackView.addArrangedSubview(nextButton)
    }
    
    
    private func setupLayout() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        lastButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            imageView.heightAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            imageView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            
            descriptionLabel.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150),
            
            horizontalStackView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 20),
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),

            firstButton.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 100),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    private func updateUI(with imageModel: ImageModel) {
        descriptionLabel.text = imageModel.description
        imageView.updateImage(imageName: imageModel.imageName)
    }
    
    private func removeFirstImage() {
        let imageModel = imageDataManager.getCurrentIndex()
        descriptionLabel.text = imageModel.description
        imageView.updateImage(imageName: imageModel.imageName)
    }
    
    private func addAction() {
        let actionForLastButton = UIAction { _ in
            let imageModel = self.imageDataManager.getLastImage()
            self.updateUI(with: imageModel)
        }
        lastButton.addAction(actionForLastButton, for: .touchUpInside)
        
//        let actionForNextButton = UIAction { _ in
//            let imageModel = self.imageDataManager.getNextImage()
//            self.updateUI(with: imageModel)
//        }
//        nextButton.addAction(actionForNextButton, for: .touchUpInside)
        
        let actionForFirstButton = UIAction { _ in
            let imageModel = self.imageDataManager.getFirstImage()
            self.updateUI(with: imageModel)
        }
        firstButton.addAction(actionForFirstButton, for: .touchUpInside)
    }
}

extension ViewController: IButtonDelegate {
    func pressedButton() {
        let imageModel = imageDataManager.getNextImage()
        self.updateUI(with: imageModel)
    }
    
    
}
