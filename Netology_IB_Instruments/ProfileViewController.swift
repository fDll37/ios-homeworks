//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 03.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let postModel = PostModel.makeArrayPost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    private func layout(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layout()
//        setupGestures()
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : postModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier) as? PhotosTableViewCell else {return UITableViewCell()}
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell else {return UITableViewCell()}
        cell.setupCell(postModel[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
// MARK: - PhotosTableViewCellDelegate
extension ProfileViewController: PhotosTableViewCellDelegate {
    
    func openViewAllCollection() {
        let allPhotVC = AllCollectionPhotosViewController()
        allPhotVC.collectionPhotos = PhotosModel.makeArrayPhotos()
        navigationController?.pushViewController(allPhotVC, animated: true)
    }
}
// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let profileHeaderView = ProfileHeaderView()
            tableView.backgroundColor = .systemGray4
            return profileHeaderView
        }
        
        return nil
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let allPhotosView = AllCollectionPhotosViewController()
            allPhotosView.collectionPhotos = PhotosModel.makeArrayPhotos()
            navigationController?.pushViewController(allPhotosView, animated: true)
        }
        
        else{
            let detailPost = DetailPostViewController()
            detailPost.setupCell(postModel[indexPath.row])
            navigationController?.pushViewController(detailPost, animated: true)
        }
        
    }
    
}

// MARK: - UIView 
extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
