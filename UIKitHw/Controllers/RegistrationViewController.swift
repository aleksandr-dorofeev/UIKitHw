//
//  RegistrationViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Registration screen.
final class RegistrationViewController: UIViewController {
  
  // MARK: - Outlets.
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var fullNameTextField: UITextField!
  @IBOutlet private weak var agreementSwitch: UISwitch!
  @IBOutlet private weak var registrationButton: UIButton!
  
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
  
  // MARK: - Actions.
  @IBAction func stateSwitchAction(_ sender: UISwitch) {
    guard agreementSwitch.isOn else { return }
    registrationButton.isEnabled = true
  }
  
  @IBAction private func registrationAction(_ sender: UIButton) {
    verifyStatesOfElements()
    forwardFullScreen()
  }
  
  private func forwardFullScreen() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard
      let serviceScreen = storyboard.instantiateViewController(
        withIdentifier: "tabBarId") as? UITabBarController
    else {
      return
    }
    serviceScreen.modalPresentationStyle = .fullScreen
    present(serviceScreen, animated: true)
  }
  
  private func verifyStatesOfElements() {
    guard
      let phoneText = phoneTextField.text,
      let emailText = emailTextField.text,
      let passwordText = passwordTextField.text,
      let nameText = fullNameTextField.text
    else {
      return
    }
    
    guard
      !phoneText.isEmpty,
      !emailText.isEmpty,
      !passwordText.isEmpty,
      !nameText.isEmpty
    else {
      errorAlert(title: "",
                 message: "Пожалуйста, заполните все поля!",
                 style: .alert)
      return
    }
    let user = User()
    guard
      user.registrationVerify(phone: phoneTextField.text,
                              password: passwordTextField.text,
                              email: emailTextField.text,
                              name: fullNameTextField.text)
    else {
      errorAlert(title: "Вы ввели некорректные данные!",
                 message: "Пожалуйста, проверьте корректность данных.",
                 style: .alert)
      return
    }
  }
}
