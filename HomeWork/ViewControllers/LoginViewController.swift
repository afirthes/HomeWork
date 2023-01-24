//
//  ViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 13.01.2023.
//

import UIKit

class LoginViewController: KeyboardAwareViewController {
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        return textField
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        return button
    }()

    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        return button
    }()

    // MARK: LifeCycle and UI setup

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupUI()
        registerButtonHandlers()
    }

    private func setupUI() {
        [
            loginTextField,
            passwordTextField,
        ].forEach {
            $0.delegate = self
        }

        [
            loginTextField,
            passwordTextField,
            loginButton,
            registerButton,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            registerButton.heightAnchor.constraint(equalToConstant: 31),

            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 31),

            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
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
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }

    @objc
    func loginTapped() {
        guard let login = loginTextField.text, let password = passwordTextField.text else {
            showAlert(with: "Error!", and: "Login and password should not be empty.")
            return
        }

        loginTextField.text = nil
        passwordTextField.text = nil

        if AuthService.shared.auth(with: login, and: password) {
            let vc = ContentViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            AuthService.shared.rememberUser(with: login)
        } else {
            showAlert(with: "Error!", and: "Wrong login or password")
        }
    }

    func showAlert(with title: String, and text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    @objc
    func registerTapped() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    // MARK: TextFieldSupplierProtocol

    override func getTextFields() -> [UITextField] {
        [passwordTextField, loginTextField]
    }
}
