//
//  Verify.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import Foundation

/// Logic for registration and login verify.
struct Verify {

  // MARK: - Private enums.
  private enum ValuesForVerify {
    static let number = "+7"
    static let maxPhoneNumbersCount = 12
    static let minCharCountPassword = 10
    static let symbol = "@"
    static let domain = "mail."
    static let space = " "
  }
  
  // MARK: - Public static methods.
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
  
 static func enterVerify(phoneEmail: String?, password: String?) -> Bool {
    if phoneEmail != nil && password != nil {
      return true
    } else {
      return false
    }
  }
}
