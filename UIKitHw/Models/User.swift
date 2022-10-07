//
//  User.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import Foundation

/// Model for registration screen.
struct User: Codable, Equatable {
  let fullName: String
  let mail: String
  let phone: String
  let password: String
}
