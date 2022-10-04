//
//  LoginViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Login screen.
final class LoginViewController: UIViewController {
  
  // MARK: - Enums.
  private enum ConfigurationForAlerts {
    static let emptyTitle = " "
    static let comebackMessage = "С возвращением\n "
    static let prepositionIn = " в "
  }
  
  // MARK: - Private IOBOutlets.
  @IBOutlet weak var phoneOrMailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  // MARK: - Life circle.
  override func viewDidLoad() {
    super.viewDidLoad()
    createNotificationForKeyboard()
  }
  
  // MARK: - Visual components.
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
    verifyEntry()
    forwardFullScreen()
  }
  
  private func forwardFullScreen() {
    successAlert(title: ConfigurationForAlerts.emptyTitle,
                 message: ConfigurationForAlerts.comebackMessage + (phoneOrMailTextField.text ?? ""),
                 style: .alert)
  }
  
  private func verifyEntry() {
    
  }
}
