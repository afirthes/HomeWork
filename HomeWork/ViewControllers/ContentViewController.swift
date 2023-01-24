//
//  ContentViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 24.01.2023.
//

import UIKit

class ContentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let logoutButton = UIButton()
        view.addSubview(logoutButton)

        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.sizeToFit()
        logoutButton.center = view.center

        logoutButton.backgroundColor = .systemGray4

        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }

    @objc
    func logoutTapped() {
        AuthService.shared.forgetUser()

        view.window?.rootViewController = LoginViewController()
        view.window?.makeKeyAndVisible()
    }
}
