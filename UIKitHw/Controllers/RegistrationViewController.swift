//
//  RegistrationViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Registration screen.
final class RegistrationViewController: UIViewController {
    
  // MARK: - Private enums.
  private enum Constants {
    static let successAlertTitle = "Вы зарегестрировались!"
    static let welcomeMessage = "Добро пожаловать\n"
    static let emptyTitle = " "
    static let emptyDataMessage = "Пожалуйста, заполните все поля!"
    static let wrongDataTitle = "Вы ввели некорректные данные!"
    static let wrongDataMessage = "Пожалуйста, проверьте корректность данных."
    static let alreadyRegistered = "Вы уже зарегестрированы!"
  }
  
  private enum UserDefaultsKeys {
    static let users = "users"
    static let mail = "mail"
  }
  
  // MARK: - Public IOutlets.
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var fullNameTextField: UITextField!
  
  // MARK: - Private IOutlets.
  @IBOutlet private weak var agreementSwitch: UISwitch!
  @IBOutlet private weak var registrationButton: UIButton!
  
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
  @IBAction private func stateSwitchAction(_ sender: UISwitch) {
    guard agreementSwitch.isOn else { return }
    registrationButton.isEnabled = true
  }
    
  @IBAction func saveMailAction(_ sender: UITextField) {
    guard let mail = emailTextField.text else { return }
    UserSettings.shared.saveMail(mail: mail, forKey: UserDefaultsKeys.mail)
  }
  
  @IBAction private func registrationAction(_ sender: UIButton) {
    verifyStatesOfElements()
    forwardFullScreen()
  }
  
  private func forwardFullScreen() {
    successAlert(title: Constants.successAlertTitle,
                 message: Constants.welcomeMessage + (fullNameTextField.text ?? Constants.emptyTitle),
                 style: .alert)
    saveUserInUserDefaults()
  }
  
  private func saveUserInUserDefaults() {
    guard
      let name = fullNameTextField.text,
      let mail = emailTextField.text,
      let phone = phoneTextField.text,
      let password = passwordTextField.text
    else { return }
    let user = User(fullName: name, mail: mail, phone: phone, password: password)
    verifyRegistration(user: user)
  }
  
  // Проверка есть ли уже такой пользователь.
  // Старался представить UserDefaults как БД, но не вышло,
  // если можно докрутить, то напишите как, пожалуйста.
  private func verifyRegistration(user: User) {
    if UserSettings.shared.users.firstIndex(of: user) != nil {
      errorAlert(title: Constants.emptyTitle, message: Constants.alreadyRegistered, style: .alert)
    } else {
      UserSettings.shared.users.append(user)
      UserDefaults.standard.set(
        try? PropertyListEncoder().encode(UserSettings.shared.users), forKey: UserDefaultsKeys.users)
    }
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
      errorAlert(title: Constants.emptyTitle,
                 message: Constants.emptyDataMessage,
                 style: .alert)
      return
    }
    guard
      Verify.registrationVerify(phone: phoneTextField.text,
                              password: passwordTextField.text,
                              email: emailTextField.text,
                              name: fullNameTextField.text)
    else {
      errorAlert(title: Constants.wrongDataTitle,
                 message: Constants.wrongDataMessage,
                 style: .alert)
      return
    }
  }
}
