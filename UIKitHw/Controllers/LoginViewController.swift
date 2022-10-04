//
//  LoginViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Login screen.
final class LoginViewController: UIViewController {
  
  // MARK: - Private Enums.
  private enum ConfigurationForAlerts {
    static let emptyTitle = " "
    static let comebackMessage = "С возвращением\n "
    static let prepositionIn = " в "
    static let noAccessLogin = "Вы еще не зарегистрировались"
  }
  
  private enum UserDefaultsKeys {
    static let mail = "mail"
  }
    
  // MARK: - Private IOBOutlets.
  @IBOutlet weak var phoneOrMailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  // MARK: - Private properties.
  private var acceptedLogin = false
  
  // MARK: - Life circle.
  override func viewDidLoad() {
    super.viewDidLoad()
    createNotificationForKeyboard()
  }
  
  // MARK: - Private methods.
  private func createNotificationForKeyboard() {
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                           object: nil,
                                           queue: nil) { _ in
      self.navigationController?.navigationBar.isHidden = true
      self.view.frame.origin.y = -100
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                           object: nil,
                                           queue: nil) { _ in
      self.navigationController?.navigationBar.isHidden = false
      self.view.frame.origin.y = 0
    }
  }
  
  // MARK: - Private actions.
  @IBAction private func loginButton(_ sender: Any) {
    guard
      let login = phoneOrMailTextField.text,
      let password = passwordTextField.text
    else { return }
    if acceptedLogin && Verify.enterVerify(phoneEmail: login, password: password) {
      forwardFullScreen()
    } else {
      errorAlert(title: ConfigurationForAlerts.emptyTitle, message: ConfigurationForAlerts.noAccessLogin, style: .alert)
    }
  }
  
  private func forwardFullScreen() {
    successAlert(title: ConfigurationForAlerts.emptyTitle,
                 message: ConfigurationForAlerts.comebackMessage + (phoneOrMailTextField.text ?? ""),
                 style: .alert)
  }
  
  @IBAction func verifyLoginAction(_ sender: UITextField) {
    guard let mail = phoneOrMailTextField.text else { return }
    if UserSettings.shared.checkMail(forKey: UserDefaultsKeys.mail) == mail {
      acceptedLogin = true
    }
  }
}
