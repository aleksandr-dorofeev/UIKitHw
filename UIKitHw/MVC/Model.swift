//
//  Model.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import Foundation

/// Model with correct word.
class Word {
  
  // MARK: - Correct word.
  func correctWord(text: String) -> String {
    switch text {
    case "leohl":
      return "hello"
    default:
      return "Incorrect word"
    }
  }
}
