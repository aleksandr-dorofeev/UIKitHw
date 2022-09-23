//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Registration controller.
class RegistrationViewController: UIViewController {
  
  // MARK: - Outlets.
  @IBOutlet weak var email: UITextField!
  @IBOutlet weak var password: UITextField!
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    configPassword()
  }
  
  // MARK: - Configs.
  func configPassword() {
    password.isSecureTextEntry = true
  }
  
  // MARK: - Actions.
  @IBAction func pushReservation(_ sender: Any) {
    let user = User()
    if user.registration(email: self.email.text, password: self.password.text) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let reserv = storyboard.instantiateViewController(withIdentifier: "ReservationViewController") as UIViewController
      reserv.view.backgroundColor = .white
      reserv.title = "Cafe Mario"
      self.navigationController?.pushViewController(reserv, animated: true)
    } else {
      errorAlert(title: "Вы ввели некорректные данные!",
                 message: "Пожалуйста, проверьте почту и пароль.",
                 style: .alert)
    }
  }
  
  @IBAction func revealPassword(_ sender: Any) {
    if password.isSecureTextEntry == true {
      password.isSecureTextEntry = false
    } else {
      password.isSecureTextEntry = true
    }
  }
  
  // MARK: - Error alert.
  func errorAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(action)
    present(alert, animated: true)
  }
}
