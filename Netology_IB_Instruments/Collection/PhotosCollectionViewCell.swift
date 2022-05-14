//
//  PhotosCollectionViewCell.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.05.2022.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    func showImageCollection(image: UIImageView)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotosCollectionViewCellDelegate?
    
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
    
        NSLayoutConstraint.activate([
            imageCollectionCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCollectionCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCollectionCell.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageCollectionCell.heightAnchor.constraint(equalTo: contentView.heightAnchor)
            ])
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageCollectionCell.isUserInteractionEnabled = true
        imageCollectionCell.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.showImageCollection(image: imageCollectionCell)
    }
}
