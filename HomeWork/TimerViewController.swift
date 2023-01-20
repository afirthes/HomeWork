//
//  TimerViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 20.01.2023.
//

import UIKit

class TimerViewController: UIViewController {
    
    private let timePicker = UIPickerView()
    
    private let chevronRightImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let atFinishedLabel = {
        let label = UILabel()
        label.text = "По окончании"
        return label
    }()
    
    private let melodyLabel = {
        let label = UILabel()
        label.text = "Радар"
        return label
    }()
    
    private let endingStack = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .systemGray4
        stack.spacing = UIStackView.spacingUseSystem
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 50)
        return stack
    }()
    
    private let chevronStack = {
        let stack = UIStackView()
        
    }
    
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
            endingStack
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        endingStack.addArrangedSubview(atFinishedLabel)
        endingStack.addArrangedSubview(melodyLabel)
        endingStack.addArrangedSubview(chevronRightImageView)
        
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
            
            endingStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            endingStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            endingStack.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 20),
            endingStack.heightAnchor.constraint(equalToConstant: 50),
            
            atFinishedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
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
