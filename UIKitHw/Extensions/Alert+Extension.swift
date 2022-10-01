//
//  Alert+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Extension for add text in alert.
extension ConfigurationViewController {
  func addTextAlert() {
    let textAlert = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ок", style: .default) { _ in
      guard let text = textAlert.textFields?.first?.text else { return }
      self.textLabel.text = text
    }
    textAlert.addTextField()
    textAlert.addAction(alertAction)
    present(textAlert, animated: true)
  }
}
