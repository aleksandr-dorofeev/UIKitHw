//
//  DismissKeyBoard+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Extension with dismiss keyboard when tapped around.
extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
