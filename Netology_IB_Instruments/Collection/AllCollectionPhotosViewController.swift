//
//  AllCollectionPhotosView.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.05.2022.
//

import UIKit

class AllCollectionPhotosViewController: UIViewController {
    
    var collectionPhotos = PhotosModel.makeArrayPhotos()
    
    private lazy var blackView: UIView = {
        let blackView = UIView()
        blackView.alpha = 0
        blackView.backgroundColor = .black
        blackView.frame = view.safeAreaLayoutGuide.layoutFrame
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imageCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let imageCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return imageCollection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        layout()
    }
    
    private func layout(){
        view.addSubview(imageCollection)
        NSLayoutConstraint.activate([
            imageCollection.topAnchor.constraint(equalTo: view.topAnchor),
            imageCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
// MARK: - UICollectionViewDataSource
extension AllCollectionPhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        cell.setupCollectionCell(collectionPhotos[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension AllCollectionPhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat {return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}

// MARK: - PhotosCollectionViewCellDelegate
extension AllCollectionPhotosViewController: PhotosCollectionViewCellDelegate {
    func showImageCollection(image: UIImageView) {
        imageCollectionCell = image
        view.addSubview(blackView)
        blackView.addSubview(imageCollectionCell)
        blackView.addSubview(crossButton)
                
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [self] in
            blackView.alpha = 1
            NSLayoutConstraint.activate([
                imageCollectionCell.topAnchor.constraint(equalTo: blackView.topAnchor, constant: UIScreen.main.bounds.midX),
                imageCollectionCell.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 16),
                imageCollectionCell.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -16),
                imageCollectionCell.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                imageCollectionCell.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

                crossButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -30),
                crossButton.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 30),
                crossButton.widthAnchor.constraint(equalToConstant: 30),
                crossButton.heightAnchor.constraint(equalToConstant: 30)
            ])
            view.layoutIfNeeded()
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
                imageCollectionCell.removeFromSuperview()
                blackView.alpha = 0.0
                blackView.removeFromSuperview()
                blackView.sendSubviewToBack(imageCollectionCell)
                view.layoutIfNeeded()
            }
        }
    }
}
