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
//        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.alpha = 0
        blackView.backgroundColor = .black
        blackView.frame = window!.bounds
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
    
    private var avatarWight = NSLayoutConstraint()
    private var avatarLeading = NSLayoutConstraint()
    private var avatarTop = NSLayoutConstraint()
    private var avatarHeight = NSLayoutConstraint()
    
    
    private func layout(){
        contentView.addSubview(imageCollectionCell)
        
        avatarTop = imageCollectionCell.topAnchor.constraint(equalTo: contentView.topAnchor)
        avatarLeading = imageCollectionCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        avatarWight = imageCollectionCell.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        avatarHeight = imageCollectionCell.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        
        
        NSLayoutConstraint.activate([
            
            avatarTop,
            avatarHeight,
            avatarLeading,
            avatarWight
            ])
    }
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageCollectionCell.isUserInteractionEnabled = true
        imageCollectionCell.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func tapAction() {
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        window?.addSubview(blackView)
//        blackView.addSubview(imageCollectionCell)
        bringSubviewToFront(imageCollectionCell)
        blackView.addSubview(crossButton)
        
        NSLayoutConstraint.activate([
            crossButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -30),
            crossButton.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 30),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [self] in
            blackView.alpha = 1
            
            NSLayoutConstraint.activate([
                imageCollectionCell.topAnchor.constraint(equalTo: blackView.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.midX),
                imageCollectionCell.leadingAnchor.constraint(equalTo: blackView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                imageCollectionCell.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                imageCollectionCell.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            ])
            
//            avatarTop.constant = UIScreen.main.bounds.midX
//            avatarLeading.constant = 16
//            avatarWight.constant = UIScreen.main.bounds.width
//            avatarHeight.constant = UIScreen.main.bounds.width
            layoutIfNeeded()
            bringSubviewToFront(imageCollectionCell)
            
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
                
                contentView.addSubview(imageCollectionCell)
                avatarTop.constant = 0
                avatarWight.constant = 0
                avatarLeading.constant = 0
                avatarHeight.constant = 0
                blackView.alpha = 0.0
                blackView.removeFromSuperview()
                
                layoutIfNeeded()
            }
        }
    }
}
