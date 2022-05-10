//
//  ProfileHeaderViewAutoLayout.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 17.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var statusText: String? = statusTextField.text
    
    private lazy var blackView: UIView = {
        let blackView = UIView()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.alpha = 0
        blackView.backgroundColor = .black
        blackView.frame = UIScreen.main.bounds
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
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "75F4BB39"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Имя Профиля"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Waiting for something"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.textColor = .black
        textField.placeholder = "Put in your new status"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    @objc private func statusTextChanged() {
        statusText = statusTextField.text ?? "New text status"
    }
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
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
        setupGestures()
        backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var avatarWight = NSLayoutConstraint()
    private var avatarHeight = NSLayoutConstraint()
    private var avatarTop = NSLayoutConstraint()
    private var avatarLeading = NSLayoutConstraint()
    
    
    private func layout(){
        let constraint: CGFloat = 16
        avatarTop = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        avatarLeading = avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: constraint)
        avatarWight = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        avatarHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            avatarTop,
            avatarLeading,
            avatarWight,
            avatarHeight,
            
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 9),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 27),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 30),
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
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func tapAction() {
        addSubview(blackView)
        addSubview(crossButton)
        bringSubviewToFront(avatarImageView)
        
        NSLayoutConstraint.activate([
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [self] in
            blackView.alpha = 0.85
            avatarImageView.layer.cornerRadius = 0
            avatarTop.constant = UIScreen.main.bounds.midX
            avatarLeading.constant = 16
            avatarWight.constant = UIScreen.main.bounds.width
            avatarHeight.constant = UIScreen.main.bounds.width
            layoutIfNeeded()
            
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
                
                sendSubviewToBack(avatarImageView)
                avatarImageView.layer.cornerRadius = 50
                avatarTop.constant = 0
                avatarLeading.constant = 16
                avatarWight.constant = 100
                avatarHeight.constant = 100
                blackView.alpha = 0.0
                blackView.removeFromSuperview()
                
                layoutIfNeeded()
            }
        }
    }
    
}
