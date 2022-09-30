//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Login screen.
final class LoginViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var titleImageView = UIImageView()
  lazy var phoneLabel = UILabel()
  lazy var passwordLabel = UILabel()
  lazy var phoneTextField = UITextField()
  lazy var passwordTextField = UITextField()
  lazy var showPasswordButton = UIButton()
  lazy var comeInButton = UIButton()
  lazy var logoImageView = UIImageView()
  lazy var logoTextLabel = UILabel()
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpViews() {
    createBackgroundColor()
    createEmailLabel()
    createLogoImageView()
    createLogoNameLabel()
    createPhoneTextField()
    createPasswordTextField()
    createPasswordLabel()
    createShowPasswordButton()
    createLoginButton()
    hideKeyboard()
  }
  
  // MARK: - Create Subviews.
  private func createBackgroundColor() {
    view.backgroundColor = .white
  }
  
  private func createLogoImageView() {
    logoImageView.image = UIImage(systemName: "icloud.fill")
    logoImageView.frame = CGRect(x: 0, y: 100, width: 200, height: 100)
    logoImageView.center.x = view.center.x
    logoImageView.tintColor = .lightGray
    view.addSubview(logoImageView)
  }
  
  private func createLogoNameLabel() {
    logoTextLabel.text = "Bringo"
    logoTextLabel.frame = CGRect(x: 80, y: 45, width: 50, height: 20)
    logoTextLabel.font = UIFont(name: "Arial", size: 17)
    logoTextLabel.textAlignment = .center
    logoTextLabel.textColor = .systemBlue
    logoImageView.addSubview(logoTextLabel)
  }
  
  private func createEmailLabel() {
    phoneLabel.frame = CGRect(x: 20, y: 350, width: 50, height: 30)
    phoneLabel.textAlignment = .left
    phoneLabel.text = "Phone"
    phoneLabel.textColor = .systemBlue
    phoneLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(phoneLabel)
  }
  
  private func createPasswordLabel() {
    passwordLabel.frame = CGRect(x: 20, y: 435, width: 70, height: 30)
    passwordLabel.textAlignment = .left
    passwordLabel.text = "Password"
    passwordLabel.textColor = .systemBlue
    passwordLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(passwordLabel)
  }
  
  private func createPhoneTextField() {
    phoneTextField.frame = CGRect(x: 20, y: 380, width: 350, height: 40)
    phoneTextField.placeholder = "Enter your number..."
    phoneTextField.font = UIFont.systemFont(ofSize: 16)
    phoneTextField.addTarget(self, action: #selector(formatTextAction), for: .editingChanged)
    phoneTextField.addBottomBorder()
    phoneTextField.delegate = self
    phoneTextField.keyboardType = .phonePad
    phoneTextField.autocorrectionType = .no
    phoneTextField.clearButtonMode = .whileEditing
    phoneTextField.contentVerticalAlignment = .center
    view.addSubview(phoneTextField)
  }
  
  private func createPasswordTextField() {
    passwordTextField.frame = CGRect(x: 20, y: 465, width: 350, height: 40)
    passwordTextField.placeholder = "Enter password..."
    passwordTextField.font = UIFont.systemFont(ofSize: 15)
    passwordTextField.addBottomBorder()
    passwordTextField.autocorrectionType = .no
    //    passwordTextField.delegate = self
    passwordTextField.isSecureTextEntry = true
    passwordTextField.keyboardType = .default
    passwordTextField.clearButtonMode = .whileEditing
    passwordTextField.contentVerticalAlignment = .center
    passwordTextField.rightView = showPasswordButton
    passwordTextField.rightViewMode = .whileEditing
    view.addSubview(passwordTextField)
  }
  
  private func createShowPasswordButton() {
    showPasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    showPasswordButton.tintColor = .gray
    showPasswordButton.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
  }
  
  private func createLoginButton() {
    comeInButton.frame = CGRect(x: 0, y: 650, width: 350, height: 50)
    comeInButton.center.x = view.center.x
    comeInButton.layer.cornerRadius = 6
    comeInButton.setTitle("Вход", for: .normal)
    comeInButton.setTitleColor( .white, for: .normal)
    comeInButton.titleLabel?.font = UIFont(name: "Arial", size: 20)
    comeInButton.backgroundColor = UIColor(red: 0.1, green: 0.3, blue: 0.6, alpha: 0.5)
    comeInButton.addTarget(self, action: #selector(pushProductScreenAction), for: .touchUpInside)
    view.addSubview(comeInButton)
  }
  
  private func hideKeyboard() {
    self.hideKeyboardWhenTappedAround()
  }
  
  // MARK: - Actions.
  @objc private func formatTextAction(_ textField: UITextField) {
    phoneTextField.text = textField.text?.format()
  }
  
  @objc private func showPasswordAction() {
    let togglePassword = passwordTextField.isSecureTextEntry
    passwordTextField.isSecureTextEntry = togglePassword ? false : true
  }
  
  @objc private func pushProductScreenAction() {
    let user = User()
    guard
      user.loginVerify(phone: self.phoneTextField.text, password: self.passwordTextField.text)
    else {
      errorAlert(title: "Вы ввели некорректные данные!",
                 message: "Пожалуйста, проверьте почту и пароль.",
                 style: .alert)
      return
    }
    let foodVC = FoodViewController()
    let navigationController = UINavigationController(rootViewController: foodVC)
    foodVC.title = "Food"
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true)
  }
}
