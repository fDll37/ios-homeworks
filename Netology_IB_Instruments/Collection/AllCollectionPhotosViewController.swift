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
        blackView.alpha = 0.8
        blackView.layer.opacity = 0
        blackView.backgroundColor = .black
        blackView.frame = UIScreen.main.bounds
        blackView.translatesAutoresizingMaskIntoConstraints = false
        return blackView
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.layer.opacity = 0
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageCollectionCell: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.layer.opacity = 0
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
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
    
    private var idPhoto: Int = 0
    private var framePhoto: CGRect = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        layout()
    }
    
    private func layout(){
        [imageCollection, blackView, imageCollectionCell, crossButton].forEach({ view.addSubview($0) })
        NSLayoutConstraint.activate([
            imageCollection.topAnchor.constraint(equalTo: view.topAnchor),
            imageCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            crossButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            crossButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalTo: crossButton.widthAnchor, multiplier: 1),
            
            imageCollectionCell.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageCollectionCell.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageCollectionCell.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageCollectionCell.heightAnchor.constraint(equalTo: imageCollectionCell.widthAnchor, multiplier: 1),
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
        self.navigationController?.isNavigationBarHidden = true
        self.imageCollectionCell.image = image.image
        
         UIView.animate(withDuration: 0.5,
                        delay: 0.0,
                        usingSpringWithDamping: 1.0,
                        initialSpringVelocity: 0.0,
                        options: .curveEaseInOut) {

             self.blackView.layer.opacity = 0.8
             self.imageCollectionCell.layer.opacity = 1
             self.view.layoutIfNeeded()

         } completion: { _ in
             UIView.animate(withDuration: 0.3,
                            delay: 0.0) {
                 self.crossButton.layer.opacity = 1
             }
         }
    }
    
    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.crossButton.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.blackView.layer.opacity = 0.0
                self.imageCollectionCell.layer.opacity = 0
                self.navigationController?.isNavigationBarHidden = false
                self.view.layoutIfNeeded()
            }
        }
    }
    
}
