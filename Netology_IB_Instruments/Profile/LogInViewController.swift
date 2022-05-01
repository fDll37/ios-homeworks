//
//  LogInViewController.swift
//  Netology_IB_Instruments
//
//  Created by Данил Менделев on 25.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let logInImageView: UIImageView = {
        let logInImageView = UIImageView(image: UIImage(named: "logo"))
        logInImageView.translatesAutoresizingMaskIntoConstraints = false
        return logInImageView
    }()
    
    private lazy var logInTextField: UITextField = {
        let logInTextField = UITextField()
        logInTextField.translatesAutoresizingMaskIntoConstraints = false
        logInTextField.layer.borderColor = UIColor.lightGray.cgColor
        logInTextField.layer.borderWidth = 0.5
        logInTextField.layer.cornerRadius = 10
        logInTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        logInTextField.textColor = .black
        logInTextField.text = "Email or phone"
        logInTextField.textAlignment = .left
        logInTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logInTextField.autocapitalizationType = .none
        logInTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: 10))
        logInTextField.leftViewMode = .always
        logInTextField.delegate = self
        return logInTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        passwordTextField.textColor = .black
        passwordTextField.text = "Password"
        passwordTextField.textAlignment = .left
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: 10))
        passwordTextField.leftViewMode = .always
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x4885CC)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(segueToProfile), for: .touchUpInside)
        return button
    }()
    @objc private func segueToProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = UIColor.systemGray6
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func layout(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logInImageView, logInTextField, passwordTextField, logInButton].forEach{contentView.addSubview($0)}
        
        let constraint:CGFloat = 16
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logInImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logInImageView.widthAnchor.constraint(equalToConstant: 100),
            logInImageView.heightAnchor.constraint(equalToConstant: 100),
            
            logInTextField.topAnchor.constraint(equalTo: logInImageView.bottomAnchor, constant: 120),
            logInTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constraint),
            logInTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constraint),
            logInTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
           
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constraint),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constraint),
            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: constraint),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constraint),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constraint),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constraint)
        ])
    }
}
// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

// MARK: - UIColor Hex-code
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
