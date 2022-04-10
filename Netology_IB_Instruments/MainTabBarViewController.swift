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

        // Do any additional setup after loading the view.
    }

    private func setupControllers() {
        profileVC.tabBarItem.title = "Профиль"
        feedVC.tabBarItem.title = "Лента"
        
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        
        profileVC.tabBarItem.image = UIImage(named: "icons8-вуди-вудпекер-48")
        feedVC.tabBarItem.image = UIImage(named: "icons8-pennywise-48")
        
        feedVC.navigationItem.title = feedVC.tabBarItem.title
        profileVC.navigationItem.title = profileVC.tabBarItem.title
        viewControllers = [feedNavigationController, profileNavigationController]
    }
}
