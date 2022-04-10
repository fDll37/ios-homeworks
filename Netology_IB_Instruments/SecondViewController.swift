//
//  SecondViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 10.04.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName:  nibNameOrNil, bundle: nibBundleOrNil)
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        print(#function)
        makeBarItem()
    }
    private func makeBarItem() {
        let buttonItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = buttonItem
    }
    @objc private func tapAction(){
        let vc = ThridViewController()
        vc.title = "Новый"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    deinit {
        print(#function)
    }
}
