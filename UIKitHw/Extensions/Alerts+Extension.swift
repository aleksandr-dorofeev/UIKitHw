//
//  Alerts+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Public template alert.
extension UIViewController {
  func errorAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(action)
    present(alert, animated: true)
  }
}

/// Extension with alert where dismiss logic and pop to root.
extension PaymentViewController {
  func paymentAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: "Ok", style: .default) { _ in
      self.dismiss(animated: false)
      self.delegate?.goToRoot()
    }
    alert.addAction(action)
    present(alert, animated: true)
  }
}
