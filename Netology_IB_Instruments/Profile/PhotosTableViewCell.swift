//
//  PhotosTableViewCell.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 02.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let imageCollectionView: UIView = {
        let imageCollectionView = UIView()
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.text = "Photos"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.addTarget(self, action: #selector(tapButtonViewPost), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapButtonViewPost() {
        print("tap tap")
    }

    private lazy var imageCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let imageCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollection.backgroundColor = .red
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        return imageCollection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        let labelInset: CGFloat = 12
            [imageCollectionView, nameLabel, button, imageCollection].forEach{contentView.addSubview($0)}
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageCollectionView.topAnchor, constant: labelInset),
            nameLabel.leadingAnchor.constraint(equalTo: imageCollectionView.leadingAnchor, constant: labelInset),
            
            button.trailingAnchor.constraint(equalTo: imageCollectionView.trailingAnchor, constant: -labelInset),
            button.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: labelInset),
            button.widthAnchor.constraint(equalToConstant: labelInset),
            
            imageCollection.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: labelInset),
            imageCollection.leadingAnchor.constraint(equalTo: imageCollectionView.leadingAnchor, constant: labelInset),
            imageCollection.trailingAnchor.constraint(equalTo: imageCollectionView.trailingAnchor, constant: -labelInset),
            imageCollection.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -labelInset)
        ])
        
    }
}
