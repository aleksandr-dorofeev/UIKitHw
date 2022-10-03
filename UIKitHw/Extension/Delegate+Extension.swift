//
//  Delegate+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// UITextFieldDelegate.
extension RegistrationViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case textField where textField == phoneTextField && textField.isFirstResponder:
      emailTextField.becomeFirstResponder()
    case textField where textField == emailTextField:
      passwordTextField.becomeFirstResponder()
    case textField where textField == passwordTextField:
      fullNameTextField.becomeFirstResponder()
    case textField where textField == fullNameTextField:
      fullNameTextField.resignFirstResponder()
    default:
      break
    }
    return true
  }
}

extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case textField where textField == phoneOrMailTextField && textField.isFirstResponder:
      passwordTextField.becomeFirstResponder()
    case textField where textField == passwordTextField:
      passwordTextField.resignFirstResponder()
    default:
      break
    }
    return true
  }
}
