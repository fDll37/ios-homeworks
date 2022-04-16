//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 10.04.2022.
//

import UIKit

struct Post{
    let title: String
    let image: UIImage?
    let text: String
}

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        makeButtonViewPost()
    }
    
    let post = Post(title: "Название поста", image: UIImage(named: "A316DE42"), text: "текст внутри данного поста, очень длинный и важный")
    
    private func makeButtonViewPost(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        button.center = view.center
        button.backgroundColor = .black
        button.setTitle("Посмотреть пост", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(tapButtonViewPost), for: .touchUpInside)
    }
    @objc private func tapButtonViewPost(){
        let postVC = PostViewController()
        postVC.navigationItem.title = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
}
