//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
}
