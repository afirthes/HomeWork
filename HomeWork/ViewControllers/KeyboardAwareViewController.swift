//
//  KeyboardAwareViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 24.01.2023.
//

import UIKit

protocol TextFieldSupplierProtocol {
    func getTextFields() -> [UITextField]
}

class KeyboardAwareViewController: UIViewController, TextFieldSupplierProtocol {
    
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupKeyboardRemovingWhenTappedOutside()
        
        
        getTextFields().forEach({ $0.delegate = self })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unregisterForKeyboardNotifications()
    }
    
    private func setupKeyboardRemovingWhenTappedOutside() {
        let touchViewTapped = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(touchViewTapped)
        view.isUserInteractionEnabled = true
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Handler objc functions
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let activeField = activeField
        {
            
            let viewHeight = view.bounds.height
            let keyboardHeight = keyboardRect.height
            let inputMaxY = activeField.frame.maxY
            
            if keyboardRect.maxY >= activeField.frame.maxY {
                self.view.frame.origin.y = 0 - (inputMaxY - (viewHeight - keyboardHeight))
            }
        }
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    // MARK: TextFieldSupplierProtocol

    func getTextFields() -> [UITextField] {
        fatalError("Fatal Error! You should override getTextFields() method in child classes.")
    }
    
}

// MARK: UITextFieldDelegate
extension KeyboardAwareViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
}


