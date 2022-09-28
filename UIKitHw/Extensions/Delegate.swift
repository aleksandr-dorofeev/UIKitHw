//
//  Delegate.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// UITextFieldDelegate.
extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    phoneTextField.resignFirstResponder()
    return true
  }
}
