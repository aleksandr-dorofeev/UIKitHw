//
//  UserSettings.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import Foundation

/// Additional class with users collection.
final class UserSettings {
  
  // MARK: - Public properties.
  // Singletone.
  static var shared = UserSettings()
  lazy var defaults = UserDefaults.standard
  var users: [User] = []
  
  // MARK: - Public methods.
  func saveMail(mail: String, forKey: String) {
    defaults.set(mail, forKey: forKey)
  }
  
  func checkMail(forKey: String) -> String {
    let mail = defaults.value(forKey: forKey) as? String ?? ""
    return mail
  }
}
