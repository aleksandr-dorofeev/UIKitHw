//
//  UserSettings.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import Foundation

final class UserSettings {
  
  private enum SettingsKeys: String {
    case userName
    case userMail
    case userPhone
    case userPassword
  }
  
  static var userName: String? {
    get {
      return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
    }
    set {
      let defaults = UserDefaults.standard
      let key = SettingsKeys.userName.rawValue
      if let name = newValue {
        print("value: \(name) was added to key \(key)")
        defaults.set(newValue, forKey: key)
      } else {
        defaults.removeObject(forKey: key)
      }
    }
  }
  
  static var userMail: String? {
    get {
      return UserDefaults.standard.string(forKey: SettingsKeys.userMail.rawValue)
    }
    set {
      let defaults = UserDefaults.standard
      let key = SettingsKeys.userMail.rawValue
      if let mail = newValue {
        print("value: \(mail) was added to key \(key)")
        defaults.set(newValue, forKey: key)
      } else {
        defaults.removeObject(forKey: key)
      }
    }
  }
  
  static var userPhone: String? {
    get {
      return UserDefaults.standard.string(forKey: SettingsKeys.userPhone.rawValue)
    }
    set {
      let defaults = UserDefaults.standard
      let key = SettingsKeys.userPhone.rawValue
      if let phone = newValue {
        print("value: \(phone) was added to key \(key)")
        defaults.set(newValue, forKey: key)
      } else {
        defaults.removeObject(forKey: key)
      }
    }
  }
  
  static var userPassword: String? {
    get {
      return UserDefaults.standard.string(forKey: SettingsKeys.userPassword.rawValue)
    }
    set {
      let defaults = UserDefaults.standard
      let key = SettingsKeys.userPassword.rawValue
      if let password = newValue {
        print("value: \(password) was added to key \(key)")
        defaults.set(newValue, forKey: key)
      } else {
        defaults.removeObject(forKey: key)
      }
    }
  }
}
