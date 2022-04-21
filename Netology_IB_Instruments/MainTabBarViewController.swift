//
//  MainTabBarViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 10.04.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let profileVC = ProfileViewController()
    let feedVC = FeedViewController()
    let postVC = PostViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        profileVC.tabBarItem.title = "Профиль"
        feedVC.tabBarItem.title = "Лента"
        
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        profileNavigationController.navigationBar.backgroundColor = .white
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        feedVC.tabBarItem.image = UIImage(systemName: "list.bullet")
        
        feedVC.navigationItem.title = feedVC.tabBarItem.title
        profileVC.navigationItem.title = profileVC.tabBarItem.title
        viewControllers = [feedNavigationController, profileNavigationController]
    }
}
