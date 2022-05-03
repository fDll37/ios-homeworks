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
    let loginVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        profileVC.tabBarItem.title = "Профиль"
        feedVC.tabBarItem.title = "Лента"
        loginVC.tabBarItem.title = "Log In"
        
        let loginNavigationController = UINavigationController(rootViewController: loginVC)
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        profileNavigationController.navigationBar.backgroundColor = .white
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        feedVC.tabBarItem.image = UIImage(systemName: "list.bullet")
        loginVC.tabBarItem.image = UIImage(systemName: "person.fill.viewfinder")
        
        profileVC.navigationItem.title = profileVC.tabBarItem.title
        feedVC.navigationItem.title = feedVC.tabBarItem.title
        loginVC.navigationItem.title = loginVC.tabBarItem.title
        
        loginVC.tabBarController?.tabBar.backgroundColor = .red
        loginVC.navigationController?.navigationBar.isHidden = true
        viewControllers = [feedNavigationController, loginNavigationController]
    }
}
