//
//  ViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 13.01.2023.
//

import UIKit

final class PostViewController: UIViewController {

    
    private var posts:[Post] = [
        Post(image:"pic1"),
        Post(image:"pic2"),
        Post(image:"destination3")
    ]
    
    private lazy var tableView: UITableView =  {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reusableId)
        tableView.contentInset = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reusableId, for: indexPath) as? PostCell {
            cell.imageView?.image = UIImage(named: posts[indexPath.row].image)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let currentImage = UIImage(named: posts[indexPath.row].image)
//        let imageCrop = currentImage!.getCropRation()
//        return tableView.frame.width / imageCrop
        
        return 400
    }
}

extension UIImage {
    func getCropRation() -> CGFloat {
        return self.size.width / self.size.height
    }
}
