//
//  User.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import Foundation

/// Model for registration screen.
struct User {
  let fullName: String? = nil
  let mail: String? = nil
  let phone: String? = nil
  let password: String? = nil
  
  func registrationVerify(phone: String?, password: String?, email: String?, name: String?) -> Bool {
    guard
      let userPhone = phone,
      let userPassword = password,
      let userEmail = email,
      let userName = name,
      userPhone.contains("+7"),
      userPhone.count == 16,
      userPassword.count >= 10,
      userEmail.contains("@"),
      userEmail.contains("mail."),
      userName.contains(" ")
    else {
      return false
    }
    return true
  }
  
  func enterVerify(phone: String?, password: String?, email: String?) -> Bool {
    if ( phone != nil || email != nil) && password != nil {
      return true
    } else {
      return false
    }
  }
}
