//
//  CustomTableViewCell.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 30.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let postView: UIView = {
        let postView = UIView()
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.backgroundColor = .white
        return postView
    }()
    
    private let postNameLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postLabel.textColor = .black
        postLabel.numberOfLines = 2
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
    }()
    
    private let postDescriptionLabel: UILabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.numberOfLines = 2
        postDescriptionLabel.textColor = UIColor.gray
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return postDescriptionLabel
    }()

    private let postLikesLabel: UILabel = {
        let postLikesLabel = UILabel()
        postLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        postLikesLabel.font = UIFont.systemFont(ofSize: 16)
        postLikesLabel.textColor = .black
        postLikesLabel.text = "Likes: "
        return postLikesLabel
    }()
    
    private let postLikesCounterLabel: UILabel = {
        let postLikesCounterLabel = UILabel()
        postLikesCounterLabel.textColor = .black
        postLikesCounterLabel.font = UIFont.systemFont(ofSize: 16)
        postLikesCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLikesCounterLabel
    }()
    
    private let postViewLabel: UILabel = {
        let postViewLabel = UILabel()
        postViewLabel.text = "Views: "
        postViewLabel.textColor = .black
        postViewLabel.font = UIFont.systemFont(ofSize: 16)
        postViewLabel.translatesAutoresizingMaskIntoConstraints = false
        return postViewLabel
    }()
    
    private let postViewCounterLabel: UILabel = {
        let postViewCounterLabel = UILabel()
        postViewCounterLabel.textColor = .black
        postViewCounterLabel.font = UIFont.systemFont(ofSize: 16)
        postViewCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        return postViewCounterLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell (_ post: PostModel){
        postNameLabel.text = post.author
        postImage.image = post.image
        postDescriptionLabel.text = post.description
        postViewCounterLabel.text = String(post.views)
        postLikesCounterLabel.text = String(post.likes)
    }
    
    private func layout(){
        [postView, postNameLabel, postImage, postDescriptionLabel, postLikesLabel, postLikesCounterLabel, postViewLabel, postViewCounterLabel].forEach{contentView.addSubview($0)}
        let labelInset: CGFloat = 16
        let imageInset: CGFloat = 12
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
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

