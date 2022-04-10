//
//  MainTabBarViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 10.04.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let firstVC = ProfileViewController()
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()

        // Do any additional setup after loading the view.
    }

    private func setupControllers() {
        firstVC.tabBarItem.title = "Первый"
        secondVC.tabBarItem.title = "Второй"
        
        let navigationController = UINavigationController(rootViewController: secondVC)
        
        firstVC.tabBarItem.image = UIImage(named: "icons8-вуди-вудпекер-48")
        secondVC.tabBarItem.image = UIImage(named: "icons8-pennywise-48")
        secondVC.navigationItem.title = "Второй VC"
        viewControllers = [firstVC, navigationController]
    }
}
