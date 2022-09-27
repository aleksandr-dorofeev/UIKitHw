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
    guard let userEmail = email, let userPassword = password else { return false }
    if userEmail.contains("@") && userEmail.contains("mail") && userPassword.count >= 5 {
      return true
    }
    return false
  }
}
