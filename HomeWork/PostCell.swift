//
//  PostCell.swift
//  HomeWork
//
//  Created by Afir Thes on 01.02.2023.
//

import UIKit

class PostCell: UITableViewCell {
    
    static let reusableId = "PostCell"
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like_icon"), for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.bottomAnchor.constraint(equalTo: likeButton.topAnchor),

            likeButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
