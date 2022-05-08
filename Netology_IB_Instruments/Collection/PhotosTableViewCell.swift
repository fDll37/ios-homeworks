//
//  PhotosTableViewCell.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 02.05.2022.
//

import UIKit


protocol PhotosTableViewCellDelegate: AnyObject{
    func openViewAllCollection()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    private let collectionPhotos = PhotosModel.makeArrayPhotos()
    
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.addTarget(self, action: #selector(tapButtonViewPost), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapButtonViewPost() {
        delegate?.openViewAllCollection()
    }

    private lazy var imageCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let imageCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
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
            nameLabel.bottomAnchor.constraint(equalTo: imageCollection.topAnchor, constant: -labelInset),
            
            button.trailingAnchor.constraint(equalTo: imageCollectionView.trailingAnchor, constant: -labelInset),
            button.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalToConstant: 20),
            
            imageCollection.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: labelInset),
            imageCollection.leadingAnchor.constraint(equalTo: imageCollectionView.leadingAnchor, constant: labelInset),
            imageCollection.trailingAnchor.constraint(equalTo: imageCollectionView.trailingAnchor, constant: -labelInset),
            imageCollection.heightAnchor.constraint(equalToConstant: 100),
            imageCollection.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: -labelInset)
        ])
        
    }
}

// MARK: - UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        cell.setupCollectionCell(collectionPhotos[indexPath.item])
        return cell
    }
    
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat {return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 5) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let AllPhotosVC = AllCollectionPhotosViewController()
//        navigationController?.pushViewController(AllPhotosVC, animated: true)
    }
}

