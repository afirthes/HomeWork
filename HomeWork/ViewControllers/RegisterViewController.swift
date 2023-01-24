//
//  RegisterViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 24.01.2023.
//

import UIKit

class RegisterViewController: KeyboardAwareViewController {

    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Login"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Password"
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "E-Mail"
        return textField
    }()
    
    let nameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Name"
        return textField
    }()
    
    let phoneField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Phone"
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {

        [
            loginTextField,
            passwordTextField,
            emailTextField,
            nameField,
            phoneField,
            registerButton,
        ].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            registerButton.heightAnchor.constraint(equalToConstant: 31),
            
            phoneField.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            phoneField.heightAnchor.constraint(equalToConstant: 31),
            
            nameField.bottomAnchor.constraint(equalTo: phoneField.topAnchor, constant: -20),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameField.heightAnchor.constraint(equalToConstant: 31),
            
            emailTextField.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 31),
            
            passwordTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 31),
            
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginTextField.heightAnchor.constraint(equalToConstant: 31),
            
        ])
    }


}
