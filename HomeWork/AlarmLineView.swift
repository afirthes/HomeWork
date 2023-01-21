//
//  AlarmLineView.swift
//  Temp
//
//  Created by Afir Thes on 21.01.2023.
//

import UIKit

final class AlarmLineView: UIView {
    
    var stack: UIStackView = UIStackView()
    var firstLabel: UILabel = UILabel()
    var secondLabael: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(stack)
        stack.addArrangedSubview(firstLabel)
        stack.addArrangedSubview(secondLabael)
        stack.addArrangedSubview(imageView)
        
        firstLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        secondLabael.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        firstLabel.text = "Название будильника"
        secondLabael.text = "Мелодия"
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFit
        stack.spacing = 4
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray5
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabael.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 15),
            imageView.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}
