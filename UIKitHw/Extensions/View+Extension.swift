//
//  View+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Extension for add border for view.
extension UIView {
  func addTopBorder() {
    let thickness: CGFloat = 0.4
    let topBorder = CALayer()
    topBorder.frame = CGRect(x: 0.0,
                             y: 0.0,
                             width: self.frame.size.width,
                             height: thickness)
    topBorder.backgroundColor = UIColor.darkGray.cgColor
    self.layer.addSublayer(topBorder)
  }
  
  func addBottomBorder() {
    let thickness: CGFloat = 0.4
    let bottomBorder = CALayer()
    bottomBorder.frame = CGRect(x: 0,
                                y: self.frame.size.height - thickness,
                                width: self.frame.size.width,
                                height: thickness)
    bottomBorder.backgroundColor = UIColor.darkGray.cgColor
    self.layer.addSublayer(bottomBorder)
  }
}
