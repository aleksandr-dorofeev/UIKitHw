//
//  UserSettings.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import Foundation

final class UserSettings {
  
  // MARK: - Private enum.
  private enum SettingsKeys: String {
    case userName
    case userMail
    case userPhone
    case userPassword
  }
  
  static let defaults = UserDefaults.standard
  
  // MARK: - Static properties.
  
  static var users: [User] {
    get {
      if let data = try? PropertyListEncoder().encode(self.users) {
        return UserDefaults.standard.set(data, forKey: "Users")
          }
    }
    set {
      if let data = defaults.data(forKey: "Users") {
        let array = try! PropertyListDecoder().decode([User].self, from: data)
      }
    }
  }
}
