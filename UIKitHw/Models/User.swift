//
//  User.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 23.09.2022.
//

import Foundation

/// Model.
class User {
  func registration(email: String?, password: String?) -> Bool {
    guard let userEmail = email else { return false }
    guard let userPassword = password else { return false }
    if userEmail.contains("@") && userEmail.contains("mail") && userPassword.count >= 5 {
      return true
    }
    return false
  }
}
