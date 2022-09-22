//
//  Model.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Model.
class Model {
  
  // MARK: - Correct name.
  func correctName(vc: UIViewController, resultLabel: UILabel) {
    let alert = UIAlertController(title: "Get start",
                                  message: "Enter leohl",
                                  preferredStyle: .alert)
    alert.addTextField { textField in
      textField.placeholder = "Enter word..."
    }
    alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
      guard let text = alert.textFields?.first?.text else { return }
      if text == "leohl" {
        resultLabel.text = "hello"
      } else {
        resultLabel.text = "You wrote incorrect text!"
      }
    }))
    vc.present(alert, animated: true)
  }
}
