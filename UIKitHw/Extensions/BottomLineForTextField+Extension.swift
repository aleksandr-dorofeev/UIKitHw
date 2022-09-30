//
//  BottomLineForTextField+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Extension for add bottom border for textFields.
extension UITextField {
  func addBottomBorder() {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
    bottomLine.backgroundColor = UIColor.lightGray.cgColor
    borderStyle = .none
    layer.addSublayer(bottomLine)
  }
}
