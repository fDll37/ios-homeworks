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
    
    private lazy var blackView: UIView = {
        let blackView = UIView()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.alpha = 0
        blackView.backgroundColor = .black
        blackView.frame = view.frame
        return blackView
    }()
    
    private let crossImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cross"))
        image.frame = CGRect(x: UIScreen.main.bounds.width - 45, y: 30, width: 25, height: 25)
        image.backgroundColor = .white
        image.alpha = 0
        return image
    }()
    
    private var leadingAvatarImage = NSLayoutConstraint()
    private var topAvatarImage = NSLayoutConstraint()
    private var widthAvatarImage = NSLayoutConstraint()
    
    private func layout(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupGestures(){
        let tapAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tableView.addGestureRecognizer(tapAvatarGesture)
        
        let tapCrossGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapCrossAction))
        self.crossImage.addGestureRecognizer(tapCrossGesture)
    }
    
    @objc private func tapAction() {
        let avatar = ProfileHeaderView().avatarImageView
        UIView.animate(withDuration: 0.8,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.view.addSubview(self.blackView)
            self.view.addSubview(self.crossImage)
            self.blackView.alpha = 1
            self.blackView.addSubview(avatar)
            avatar.translatesAutoresizingMaskIntoConstraints = true
            avatar.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 125, y: (UIScreen.main.bounds.height / 2) - 125, width: 250, height: 250)
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0) {
                self.crossImage.alpha = 1
                avatar.layer.cornerRadius = 0
            }
        }

    }
    
    @objc private func tapCrossAction() {
        blackView.alpha = 0
        crossImage.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupGestures()
        view.backgroundColor = .systemGray4
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layout()
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
