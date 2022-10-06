//
//  AddBottomBorder+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Add bottom border for label.
extension UILabel {
  func addBottomBorder() {
    let thickness: CGFloat = 0.4
    let bottomBorder = CALayer()
    bottomBorder.frame = CGRect(x: 0,
                                y: self.frame.size.height - thickness,
                                width: self.frame.size.width,
                                height: thickness)
    bottomBorder.backgroundColor = UIColor.darkGray.cgColor
    layer.addSublayer(bottomBorder)
  }
}
