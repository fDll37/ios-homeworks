//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray5
        stackView.axis = .horizontal 
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press", for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapAction(){
        textLabel.text = "New text"
    }
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some text"
        label.backgroundColor = .cyan
        return label
    }()
    
    
    let profileHeaderView = ProfileHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .lightGray
//        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    
    private func layout(){
        view.addSubview(stackView)
//        [redView, blueView, button, textLabel].forEach{view.addSubview($0)}
        [redView, blueView].forEach{stackView.addArrangedSubview($0)}
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.heightAnchor.constraint(equalToConstant : 250),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            redView.widthAnchor.constraint(equalToConstant: 100),
//            redView.heightAnchor.constraint(equalToConstant: 200)
//        ])
//
//        NSLayoutConstraint.activate([
//            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
//            blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 20),
//            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor)
//        ])
        
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 16),
//            button.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
//            button.widthAnchor.constraint(equalToConstant: 150)
//        ])
//
//        NSLayoutConstraint.activate([
//            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }
    
}
