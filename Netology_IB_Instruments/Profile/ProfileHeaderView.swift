//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 16.04.2022.
//

import UIKit


class ProfileHeaderView: UIView {

    private var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(nameProfile)
        addSubview(textFieldStatus)
        addSubview(button)
        addSubview(textFieldInput)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let profileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "75F4BB39"))
        imageView.layer.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameProfile: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 27, width: UIScreen.main.bounds.width, height: 20))
        label.text = "Имя Профиля"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 132, width: UIScreen.main.bounds.width - 32, height: 50))
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.titleLabel?.textAlignment = .center
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    @objc private func buttonPressed() {
        textFieldStatus.text = statusText
        print(textFieldStatus.text ?? "")
    }
    
    let textFieldStatus: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 20))
        textField.textColor = .gray
        textField.text = "Waiting for something"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return textField
    }()
    
    let textFieldInput: UITextField = {
        let textField = UITextField(frame: CGRect(x: 160, y: 78, width: (UIScreen.main.bounds.width / 2), height: 40))
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.text = ""
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    @objc private func statusTextChanged() {
        statusText = textFieldInput.text ?? ""
    }
}
