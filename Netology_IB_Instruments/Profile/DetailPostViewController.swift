//
//  DetailPostViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 01.05.2022.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var postView: UIView = {
        let postView = UIView()
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.backgroundColor = .white
        return postView
    }()
    
    private lazy var postNameLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postLabel.textColor = .black
        postLabel.numberOfLines = 2
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    private lazy var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
    }()
    
    private lazy var postDescriptionLabel: UILabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.numberOfLines = 0
        postDescriptionLabel.textColor = UIColor.gray
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return postDescriptionLabel
    }()

    private lazy var postLikesLabel: UILabel = {
        let postLikesLabel = UILabel()
        postLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        postLikesLabel.font = UIFont.systemFont(ofSize: 16)
        postLikesLabel.textColor = .black
        postLikesLabel.text = "Likes: "
        return postLikesLabel
    }()
    
    private lazy var postLikesCounterLabel: UILabel = {
        let postLikesCounterLabel = UILabel()
        postLikesCounterLabel.textColor = .black
        postLikesCounterLabel.font = UIFont.systemFont(ofSize: 16)
        postLikesCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLikesCounterLabel
    }()
    
    private lazy var postViewLabel: UILabel = {
        let postViewLabel = UILabel()
        postViewLabel.text = "Views: "
        postViewLabel.textColor = .black
        postViewLabel.font = UIFont.systemFont(ofSize: 16)
        postViewLabel.translatesAutoresizingMaskIntoConstraints = false
        return postViewLabel
    }()
    
    private lazy var postViewCounterLabel: UILabel = {
        let postViewCounterLabel = UILabel()
        postViewCounterLabel.textColor = .black
        postViewCounterLabel.font = UIFont.systemFont(ofSize: 16)
        postViewCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        return postViewCounterLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        layout()
        setupGestures()
    }

    func setupCell (_ post: PostModel){
        postNameLabel.text = post.author
        postImage.image = post.image
        postDescriptionLabel.text = post.description
        postViewCounterLabel.text = String(post.views)
        postLikesCounterLabel.text = String(post.likes)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLikePost))
        postLikesLabel.isUserInteractionEnabled = true
        postLikesLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapLikePost() {
        if let postLikesCounter = postLikesCounterLabel.text {
            if let postLikesCounter = Int(postLikesCounter) {
                postLikesCounterLabel.text = String(postLikesCounter + 1)
            }
        }
    }
    
    private func layout(){
        view.addSubview(scrollView)
        scrollView.addSubview(postView)
        [postNameLabel, postImage, postDescriptionLabel, postLikesLabel, postLikesCounterLabel, postViewLabel, postViewCounterLabel].forEach{postView.addSubview($0)}
        let labelInset: CGFloat = 16
        let imageInset: CGFloat = 12
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            postView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            postNameLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: labelInset),
            postNameLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: labelInset),
            postNameLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -labelInset),
            
            postImage.topAnchor.constraint(equalTo: postNameLabel.bottomAnchor, constant: imageInset),
            postImage.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            postImage.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: screenWidth),
            postImage.widthAnchor.constraint(equalToConstant: screenWidth),

            postDescriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: labelInset),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: labelInset),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -labelInset),

            postLikesLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: labelInset),
            postLikesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: labelInset),
            postLikesLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -labelInset),

            postLikesCounterLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: labelInset),
            postLikesCounterLabel.leadingAnchor.constraint(equalTo: postLikesLabel.trailingAnchor),
            postLikesCounterLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -labelInset),

            postViewCounterLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: labelInset),
            postViewCounterLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -labelInset),
            postViewCounterLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -labelInset),

            postViewLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: labelInset),
            postViewLabel.trailingAnchor.constraint(equalTo: postViewCounterLabel.leadingAnchor),
            postViewLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -labelInset)
        ])
    }



}
