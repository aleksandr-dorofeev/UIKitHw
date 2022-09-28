//
//  User.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import Foundation

/// Model for login screen.
class User {
  func loginVerify(phone: String?, password: String?) -> Bool {
    guard
      let userPhone = phone,
      let userPassword = password,
      userPhone.contains("+7"),
      userPhone.count == 18,
      userPassword.count >= 5
    else {
      return false
    }
    return true
  }
}
