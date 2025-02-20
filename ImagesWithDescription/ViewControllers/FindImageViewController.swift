//
//  FindImageViewController.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 19.02.25.
//

import UIKit

class FindImageViewController: UIViewController {
    private let imageDataManager: ImageDataManager
    private let imageManager = ImageManager()
    
    private let textLabel = UILabel()
    private let textField = UITextField()
    private let button = UIButton()
    private let imageView = ImageView(imageName: "")
    private let descriptionLabel = UILabel()



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
        view.backgroundColor = .white
        setupLabel()
        setupTextField()
        setupButton()
        view.addSubview(imageView)
        setupDescriptionLabel()
        setupLayout()
        
        addAction()
        textField.delegate = self
    }
    
    private func setupLabel() {
        textLabel.text = "Введите название картинки"
        textLabel.textAlignment = .center
        textLabel.textColor = .black
        textLabel.font = .systemFont(ofSize: 16)
        view.addSubview(textLabel)
    }
    
    private func setupTextField() {
        textField.placeholder = "Название картинки"
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
    }
    
    private func setupButton() {
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(button)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
    }
    
    private func addAction() {
        let action = UIAction { _ in
            let imageModel = self.imageDataManager.getImage(self.textField.text ?? "")
            self.updateUI(with: imageModel)
        }
        button.addAction(action, for: .touchUpInside)
    }
    
    private func updateUI(with imageModel: ImageModel?) {
        if let imageModel = imageModel {
            descriptionLabel.text = imageModel.description
            imageView.updateImage(imageName: imageModel.imageName)
            textLabel.text = "Такая картинка есть"
        } else {
            descriptionLabel.text = ""
            imageView.updateImage(imageName: "")
            textLabel.text = "Такой картинки нет"
        }
    }
    
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 100),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

}

extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let imageModel = self.imageDataManager.getImage(self.textField.text ?? "")
        self.updateUI(with: imageModel)
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
}
