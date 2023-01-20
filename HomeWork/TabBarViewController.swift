//
//  ViewController.swift
//  HomeWork
//
//  Created by Afir Thes on 13.01.2023.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = delegate
        
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = .systemOrange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = TimerViewController()
        let tabOneBarItem = UITabBarItem(title: "Alarm", image: UIImage(systemName: "alarm"), selectedImage: UIImage(systemName: "alarm.filled"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        let tabTwo = AlarmViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Timer", image: UIImage(systemName: "timer.circle"), selectedImage: UIImage(systemName: "timer.circle.filled"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}

