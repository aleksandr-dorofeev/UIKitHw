//
//  ErrorAlert.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Public error alert.
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
