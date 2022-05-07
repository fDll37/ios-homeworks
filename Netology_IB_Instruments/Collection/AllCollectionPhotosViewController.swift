//
//  AllCollectionPhotosView.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.05.2022.
//

import UIKit

class AllCollectionPhotosViewController: UIViewController {
    
    var collectionPhotos = PhotosModel.makeArrayPhotos()
    
    private lazy var imageCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let imageCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier!)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier!, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCollectionCell(collectionPhotos[indexPath.item])
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