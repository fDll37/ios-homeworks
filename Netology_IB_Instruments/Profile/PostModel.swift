//
//  PostModel.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 30.04.2022.
//

import UIKit

struct PostModel{
    let author: String
    let description: String?
    let image: UIImage?
    let likes: Int
    let views: Int
    
    static func makeArrayPost() -> [PostModel] {
        var post = [PostModel]()
        post.append(PostModel(author: "Author", description: "First post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post viewFirst post description and this is so big text for testing on table view and in first post view", image: UIImage(named: "F563934B"), likes: 0, views: 0))
        post.append(PostModel(author: "AuthorSecond", description: "Second post description and this is so big text for testing on table view and in second post view", image: UIImage(named: "E11815DC"), likes: 0, views: 0))
        post.append(PostModel(author: "AuthorThred", description: "Three post description and this is so big text for testing on table view and in post three view", image: UIImage(named: "A316DE42"), likes: 0, views: 0))
        post.append(PostModel(author: "AuthorFoured", description: "Four post description and this is so big text for testing on table view and in four post view", image: UIImage(named: "3F851C2A"), likes: 0, views: 0))
        return post
    }
}
