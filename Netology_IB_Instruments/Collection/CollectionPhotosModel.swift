//
//  CollectionPhotosModel.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.05.2022.
//

import UIKit


struct PhotosModel {
    let image: UIImage?
    
    static func makeArrayPhotos() -> [PhotosModel]{
        var collectionPhotos = [PhotosModel]()
        for element in 0...19 {
            collectionPhotos.append(PhotosModel(image: UIImage(named: "\(element)")))
        }
        return collectionPhotos
    }
}
