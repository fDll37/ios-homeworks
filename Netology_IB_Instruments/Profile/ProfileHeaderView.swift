//
//  ProfileHeaderViewAutoLayout.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 17.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
   
    private lazy var statusText: String? = statusTextField.text
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "75F4BB39"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Имя Профиля"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Waiting for something"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.textColor = .black
        textField.text = "Put in your new status"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    @objc private func statusTextChanged() {
        statusText = statusTextField.text ?? ""
    }
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        endEditing(true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach{addSubview($0)}
        layout()
        backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        let constraint: CGFloat = 16
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: constraint),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 9),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
           
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 27),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
            
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: constraint),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: constraint),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -constraint)
        ])
    }
    
}
