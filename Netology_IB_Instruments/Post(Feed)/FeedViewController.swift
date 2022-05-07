//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 10.04.2022.
//

import UIKit



class FeedViewController: UIViewController {

    private let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Посмотреть пост", for: .normal)
        button.addTarget(self, action: #selector(tapFirstButtonViewPost), for: .touchUpInside)
        return button
        }()
    
   @objc private func tapFirstButtonViewPost(){
        let postVC = PostViewController()
        postVC.navigationItem.title = firstPost.author
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Посмотреть пост2", for: .normal)
        button.addTarget(self, action: #selector(tapSecondButtonViewPost), for: .touchUpInside)
        return button
        }()
    
   @objc private func tapSecondButtonViewPost(){
        let postVC = PostViewController()
        postVC.navigationItem.title = secondPost.author
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .brown
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        layoutStackView()
    }
    
    let firstPost = PostModel(author: "Author", description: "description this first post", image: UIImage(), likes: 0, views: 0)
    let secondPost = PostModel(author: "second", description: "description this second post", image: UIImage(), likes: 1, views: 1)

    private func layoutStackView(){
        
        view.addSubview(stackView)
        [firstButton, secondButton].forEach{stackView.addArrangedSubview($0)}
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    


}
