//
//  User.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 27.09.2022.
//

import Foundation

/// Logic for entry screen.
class User {
  func registration(email: String?, password: String?) -> Bool {
    guard
      let userEmail = email,
      let userPassword = password,
      userEmail.contains("@"),
      userEmail.contains("mail"),
      userPassword.count >= 5
    else {
      return false
    }
    return true
  }
}
