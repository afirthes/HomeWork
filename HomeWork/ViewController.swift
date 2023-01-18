//
//  ViewController.swift
//  UIActionVCExplore
//
//  Created by Afir Thes on 13.01.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    var imageToShareImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.meetingPhoto
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var shareImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share image", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    var stringToShareTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Text to share"
        textField.font = UIFont(name: "Avenir", size: 22)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    var shareTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share text", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        [imageToShareImageView, shareImageButton, stringToShareTextField, shareTextButton].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            imageToShareImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageToShareImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageToShareImageView.widthAnchor.constraint(equalToConstant: 300),
            imageToShareImageView.heightAnchor.constraint(equalToConstant: 300),
            
            shareImageButton.topAnchor.constraint(equalTo: imageToShareImageView.bottomAnchor, constant: 12),
            shareImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stringToShareTextField.topAnchor.constraint(equalTo: shareImageButton.bottomAnchor, constant: 24),
            stringToShareTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stringToShareTextField.widthAnchor.constraint(equalToConstant: 300),
            
            shareTextButton.topAnchor.constraint(equalTo: stringToShareTextField.bottomAnchor, constant: 12),
            shareTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        shareImageButton.addTarget(self, action: #selector(shareImageAction), for: .touchUpInside)
        shareTextButton.addTarget(self, action: #selector(shareTextAction), for: .touchUpInside)
    }

    @objc func shareImageAction() {
        guard let image = Constants.meetingPhoto else {
            showAlert(with: "Somwthing went wrong!", and: "Cant find image.")
            return
        }
        let ac = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @objc func shareTextAction() {
        guard let text = stringToShareTextField.text, !text.isEmpty else {
            showAlert(with: "Text field is empty.", and: "Please enter some text to share.")
            return
        }
        let ac = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertCancel = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(alertCancel)
        present(alertVC, animated: true)
    }
    
}

//Mark: - UIActivityItemSource
extension ViewController: UIActivityItemSource {
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return stringToShareTextField.text ?? "<empty>"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return stringToShareTextField.text ?? "<empty>"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return "Shared message topic (for email)"
    }
}

