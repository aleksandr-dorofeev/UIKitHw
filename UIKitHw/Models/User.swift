//
//  User.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import Foundation

/// Model for registration screen.
struct User {
  
  // MARK: - Enums.
  enum ValuesForVerify {
    static let number = "+7"
    static let maxPhoneNumbersCount = 12
    static let minCharCountPassword = 10
    static let symbol = "@"
    static let domain = "mail."
    static let space = " "
  }
  
  let fullName: String
  let mail: String
  let phone: String
  let password: String
  
  init(fullName: String, mail: String, phone: String, password: String) {
    self.fullName = fullName
    self.mail = mail
    self.phone = phone
    self.password = password
  }
      
  // MARK: - Public methods.
 static func registrationVerify(phone: String?, password: String?, email: String?, name: String?) -> Bool {
    guard
      let userPhone = phone,
      let userPassword = password,
      let userEmail = email,
      let userName = name,
      userPhone.contains(ValuesForVerify.number),
      userPhone.count == ValuesForVerify.maxPhoneNumbersCount,
      userPassword.count >= ValuesForVerify.minCharCountPassword,
      userEmail.contains(ValuesForVerify.symbol),
      userEmail.contains(ValuesForVerify.domain),
      userName.contains(ValuesForVerify.space)
    else {
      return false
    }
    return true
  }
  
 static func enterVerify(phone: String?, password: String?, email: String?) -> Bool {
    if ( phone != nil || email != nil) && password != nil {
      return true
    } else {
      return false
    }
  }
}
