//
//  PhotosCollectionViewCell.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var blackView: UIView = {
        let blackView = UIView()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.alpha = 0
        blackView.backgroundColor = .black
        blackView.frame = UIScreen.main.bounds
        return blackView
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.alpha = 0.0
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageCollectionCell: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionCell(_ post: PhotosModel){
        imageCollectionCell.image = post.image
    }
    
    private var avatarBottom = NSLayoutConstraint()
    private var avatarTrailing = NSLayoutConstraint()
    private var avatarTop = NSLayoutConstraint()
    private var avatarLeading = NSLayoutConstraint()
    
    
    private func layout(){
        contentView.addSubview(imageCollectionCell)
        
        avatarTop = imageCollectionCell.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor)
        avatarLeading = imageCollectionCell.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor)
        avatarTrailing = imageCollectionCell.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)
        avatarBottom = imageCollectionCell.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        
        
        NSLayoutConstraint.activate([
            avatarTop,
            avatarLeading,
            avatarTrailing,
            avatarBottom
            ])
    }
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageCollectionCell.isUserInteractionEnabled = true
        imageCollectionCell.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func tapAction() {
        contentView.addSubview(blackView)
        contentView.bringSubviewToFront(blackView)
        blackView.addSubview(crossButton)
        blackView.addSubview(imageCollectionCell)
        
        NSLayoutConstraint.activate([
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [self] in
            blackView.alpha = 0.85
            avatarTop.constant = 1
            avatarLeading.constant = 1
            avatarBottom.constant = 1
            avatarTrailing.constant = 1
            layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [self] in
                crossButton.alpha = 1.0
            }
        }
    }
    
    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [self] in
            crossButton.alpha = 0.0
            crossButton.removeFromSuperview()
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
                
                contentView.sendSubviewToBack(imageCollectionCell)
                avatarTop.constant = 0
                avatarLeading.constant = 0
                avatarTrailing.constant = 0
                avatarBottom.constant = 0
                blackView.alpha = 0.0
                blackView.removeFromSuperview()
                
                layoutIfNeeded()
            }
        }
    }
}
