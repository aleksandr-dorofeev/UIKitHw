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
  
  // MARK: - Private IBOutlets.
  @IBOutlet private weak var agreementSwitch: UISwitch!
  @IBOutlet private weak var registrationButton: UIButton!
  
  // MARK: - Life cycle.
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
    alert(title: Constants.successAlertTitle,
                 message: Constants.welcomeMessage + (fullNameTextField.text ?? Constants.emptyTitle),
                 style: .alert,
                 type: TypeOfAlert.success)
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
      alert(title: Constants.emptyTitle,
            message: Constants.alreadyRegistered,
            style: .alert,
            type: TypeOfAlert.defaults)
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
    verifyIfTextEmpty(phone: phoneText, mail: emailText, password: passwordText, name: nameText)
    verifyRegistration(phone: phoneText, mail: emailText, password: passwordText, name: nameText)
  }
  
  private func verifyIfTextEmpty(phone: String, mail: String, password: String, name: String) {
    guard
      !phone.isEmpty,
      !mail.isEmpty,
      !password.isEmpty,
      !name.isEmpty
    else {
      alert(title: Constants.emptyTitle,
                 message: Constants.emptyDataMessage,
                 style: .alert,
                 type: TypeOfAlert.defaults)
      return
    }
  }
  
  private func verifyRegistration(phone: String, mail: String, password: String, name: String) {
    guard
      Verify.registrationVerify(phone: phone,
                              password: password,
                              email: mail,
                              name: name)
    else {
      alert(title: Constants.wrongDataTitle,
                 message: Constants.wrongDataMessage,
                 style: .alert,
                 type: TypeOfAlert.defaults)
      return
    }
  }
}
