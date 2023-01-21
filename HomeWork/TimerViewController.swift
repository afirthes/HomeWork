//
//  TimerViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 20.01.2023.
//

import UIKit

class TimerViewController: UIViewController {
    
    private let timePicker = UIPickerView()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let cancelButton = {
        let button = RoundedButton()
        button.borderWidth = 3
        button.backgroundColor = .none
        button.cornerRadius = 50
        button.setTitleColor(.systemOrange, for: .normal)
        button.tintColor = .systemOrange
        button.setTitle("Отмена", for: .normal)
        return button
    }()
    
    private let startButton = {
        let button = RoundedButton()
        button.borderWidth = 3
        button.backgroundColor = .none
        button.cornerRadius = 50
        button.setTitleColor(.systemOrange, for: .normal)
        button.tintColor = .systemOrange
        button.setTitle("Старт", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    func setupUI() {
        timePicker.delegate = self
        timePicker.dataSource = self
        
        [
            timePicker,
            startButton,
            cancelButton,
            stack
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        // Example data
        let a1 = AlarmLineView()
        let a2 = AlarmLineView()
        let a3 = AlarmLineView()
        
        stack.addArrangedSubview(a1)
        stack.addArrangedSubview(a2)
        stack.addArrangedSubview(a3)
        
        NSLayoutConstraint.activate([
            timePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            cancelButton.heightAnchor.constraint(equalToConstant: 100),
            
            startButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 100),
            
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            stack.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 20),

            
            a1.heightAnchor.constraint(equalToConstant: 50),
            a2.heightAnchor.constraint(equalToConstant: 50),
            a3.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}


extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) ч"
        case 1:
            return "\(row) мин"
        case 2:
            return "\(row) с"
        default:
            return ""
        }
    }
}
