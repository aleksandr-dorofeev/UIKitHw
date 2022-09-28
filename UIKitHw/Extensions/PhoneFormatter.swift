//
//  PhoneFormatter.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Formatting to phone mode.
extension String {
  func format() -> String {
    let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    let mask = "+X (XXX) XXX-XX-XX"
    
    var index = numbers.startIndex
    for char in mask where index < numbers.endIndex {
      if char == "X" {
        result.append(numbers[index])
        index = numbers.index(after: index)
      } else {
        result.append(char)
      }
    }
    return result
  }
}
