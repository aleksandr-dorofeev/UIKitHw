//
//  AddShadow+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Extension with setup shadow for label text.
extension UILabel {
  func setTextWithShadow(_ string: String) {
    self.layer.shadowOffset = CGSize(width: 0, height: 0)
    self.layer.shadowOpacity = 1
    self.layer.shadowRadius = 6
  }
}
