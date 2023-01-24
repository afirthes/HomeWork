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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "E-Mail"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Name"
        return textField
    }()
    
    let phoneTextField: UITextField = {
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
        registerButtonHandlers()
    }
    
    private func setupUI() {

        [
            loginTextField,
            passwordTextField,
            emailTextField,
            nameTextField,
            phoneTextField,
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
            
            phoneTextField.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            phoneTextField.heightAnchor.constraint(equalToConstant: 31),
            
            nameTextField.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: -20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 31),
            
            emailTextField.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20),
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

    func registerButtonHandlers() {
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }
    
    @objc func registerTapped() {
        
        guard let name = nameTextField.text, !name.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let login = loginTextField.text, !login.isEmpty,
              let phone = phoneTextField.text, !phone.isEmpty else {
            
            showAlert(with: "Error!", and: "Please fill all fields.")
            return
        }
        
        let registration = RegistrationInfo(
            name: name,
            password: password,
            email: email,
            login: login,
            phone: phone
        )
        
        if AuthService.shared.register(with: registration) {
            showAlert(with: "Registered", and: "Registered \(registration.login) user") { action in
                self.dismiss(animated: true)
            }
        } else {
            showAlert(with: "Error", and: "User \(registration.login) already exists.")
        }

    }
    
    func showAlert(with title: String, and text: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    // MARK: TextFieldSupplierProtocol
    
    override func getTextFields() -> [UITextField] {
        [
            loginTextField,
            passwordTextField,
            emailTextField,
            nameTextField,
            phoneTextField
        ]
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let fields = getTextFields()
        
        if fields.last === textField {
            textField.resignFirstResponder()
            return true
        } else {
            let index = fields.lastIndex(of: textField)!
            fields[index + 1].becomeFirstResponder()
            return true
        }
    }
}
