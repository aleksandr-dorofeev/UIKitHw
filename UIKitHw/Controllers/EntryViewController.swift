//
//  EntryViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 27.09.2022.
//

import UIKit

/// Screen with entry in shop.
class EntryViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var titleImageView = UIImageView()
  lazy var signInLabel = UILabel()
  lazy var emailLabel = UILabel()
  lazy var passwordLabel = UILabel()
  lazy var faceIdLabel = UILabel()
  lazy var emailTextField = UITextField()
  lazy var passwordTextField = UITextField()
  lazy var faceIdSwitch = UISwitch()
  lazy var showPasswordButton = UIButton()
  lazy var comeInButton = UIButton()
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpViews() {
    createTitleImageView()
    createSignInLabel()
    createEmailLabel()
    createEmailTextField()
    createPasswordTextField()
    createPasswordLabel()
    createFaceIdLabel()
    createShowPasswordButton()
    createFaceIdSwitch()
    createLoginButton()
  }
  
  // MARK: - Create Subviews.
  private func createTitleImageView() {
    titleImageView.frame = CGRect(x: 0, y: 130, width: 250, height: 100)
    titleImageView.image = UIImage(named: "NBLogo")
    titleImageView.contentMode = .scaleAspectFit
    titleImageView.center.x = view.center.x
    view.addSubview(titleImageView)
  }
  
  private func createSignInLabel() {
    signInLabel.frame = CGRect(x: 15, y: 300, width: 120, height: 50)
    signInLabel.textAlignment = .left
    signInLabel.text = "Sign In"
    signInLabel.textColor = .black
    signInLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
    view.addSubview(signInLabel)
  }
  
  private func createEmailLabel() {
    emailLabel.frame = CGRect(x: 20, y: 350, width: 50, height: 30)
    emailLabel.textAlignment = .left
    emailLabel.text = "Email"
    emailLabel.textColor = .systemBlue
    emailLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(emailLabel)
  }
  
  private func createPasswordLabel() {
    passwordLabel.frame = CGRect(x: 20, y: 420, width: 70, height: 30)
    passwordLabel.textAlignment = .left
    passwordLabel.text = "Password"
    passwordLabel.textColor = .systemBlue
    passwordLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(passwordLabel)
  }
  
  private func createFaceIdLabel() {
    faceIdLabel.frame = CGRect(x: 190, y: 520, width: 115, height: 30)
    faceIdLabel.textAlignment = .left
    faceIdLabel.text = "Вход по Face ID"
    faceIdLabel.textColor = .black
    faceIdLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(faceIdLabel)
  }
  
  private func createEmailTextField() {
    emailTextField.frame = CGRect(x: 20, y: 380, width: 350, height: 40)
    emailTextField.placeholder = "Enter email..."
    emailTextField.font = UIFont.systemFont(ofSize: 15)
    emailTextField.borderStyle = .roundedRect
    emailTextField.autocorrectionType = .no
    emailTextField.keyboardType = .emailAddress
    emailTextField.clearButtonMode = .whileEditing
    emailTextField.contentVerticalAlignment = .center
    view.addSubview(emailTextField)
  }
  
  private func createPasswordTextField() {
    passwordTextField.frame = CGRect(x: 20, y: 450, width: 350, height: 40)
    passwordTextField.placeholder = "Enter password..."
    passwordTextField.font = UIFont.systemFont(ofSize: 15)
    passwordTextField.borderStyle = .roundedRect
    passwordTextField.autocorrectionType = .no
    passwordTextField.isSecureTextEntry = true
    passwordTextField.keyboardType = .asciiCapable
    passwordTextField.clearButtonMode = .whileEditing
    passwordTextField.contentVerticalAlignment = .center
    passwordTextField.rightView = showPasswordButton
    passwordTextField.rightViewMode = .whileEditing
    view.addSubview(passwordTextField)
  }
  
  private func createFaceIdSwitch() {
    faceIdSwitch.frame = CGRect(x: 320, y: 520, width: 0, height: 0)
    faceIdSwitch.isOn = true
    faceIdSwitch.setOn(true, animated: false)
    view.addSubview(faceIdSwitch)
  }
  
  private func createShowPasswordButton() {
    showPasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    showPasswordButton.tintColor = .gray
    showPasswordButton.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
  }
  
  private func createLoginButton() {
    comeInButton.frame = CGRect(x: 220, y: 650, width: 350, height: 50)
    comeInButton.center.x = view.center.x
    comeInButton.layer.cornerRadius = 6
    comeInButton.setTitle("Вход", for: .normal)
    comeInButton.setTitleColor(.white, for: .normal)
    comeInButton.backgroundColor = .black
    comeInButton.addTarget(self, action: #selector(pushProductScreenAction), for: .touchUpInside)
    view.addSubview(comeInButton)
  }
  
  // MARK: - Actions.
  @objc func showPasswordAction() {
    let togglePassword = passwordTextField.isSecureTextEntry
    passwordTextField.isSecureTextEntry = togglePassword ? false : true
  }
  
  @objc func pushProductScreenAction() {
    let user = User()
    if user.registration(email: self.emailTextField.text, password: self.passwordTextField.text) {
      let productVc = ProductViewController()
      productVc.title = "New Balance"
      self.navigationController?.pushViewController(productVc, animated: true)
    } else {
      errorAlert(title: "Вы ввели некорректные данные!",
                 message: "Пожалуйста, проверьте почту и пароль.",
                 style: .alert)
    }
  }
  
  // MARK: - Error alert.
  private func errorAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(action)
    present(alert, animated: true)
  }
}
