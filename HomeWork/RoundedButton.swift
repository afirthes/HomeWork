//
//  RoundedButton.swift
//  HomeWork
//
//  Created by Afir Thes on 13.01.2023.
//

import UIKit

class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            if cornerRadius == -1 {
                layer.cornerRadius = bounds.width / 2
            } else {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    private let backgroundLayer = CAShapeLayer()
    
    override var backgroundColor: UIColor? {
        set {
            setBackgroundColor(newValue)
        }
        get {
            guard let backgroundColor = backgroundLayer.backgroundColor else { return nil }
            return UIColor(cgColor: backgroundColor)
        }
    }
    
    func configure() {
        clipsToBounds = true
        layer.borderColor = tintColor.cgColor
        layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        layer.borderColor = tintColor.cgColor
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        clipsToBounds = true
        layer.borderColor = tintColor.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if cornerRadius == -1 {
            layer.cornerRadius = bounds.width / 2
        }
        backgroundLayer.frame = layer.bounds
        backgroundLayer.cornerRadius = layer.cornerRadius
    }
    
    func setBackgroundColor(_ color: UIColor?, animated: Bool = true) {
        let color = color ?? .clear
        guard animated, color != .clear else {
            backgroundLayer.backgroundColor = color.cgColor
            return
        }
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.05
        animation.toValue = 1
        animation.duration = 0.3
        
        backgroundLayer.backgroundColor = color.cgColor
        backgroundLayer.add(animation, forKey: "scale")
        
    }
    
}
