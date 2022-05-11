//
//  PostViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 10.04.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        makeBarItem()
    }
    
    private func makeBarItem() {
        let buttonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc private func tapAction(){
        let infoVC = InfoViewController()
        infoVC.title = "Информация о посте"
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
}
