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
    let shadow = NSShadow()
    shadow.shadowBlurRadius = 3
    shadow.shadowOffset = CGSize(width: 3, height: 3)
    shadow.shadowColor = UIColor.black.withAlphaComponent(0.5)
    let attributes = [ NSAttributedString.Key.shadow: shadow ]
    let attributedString = NSAttributedString(string: string, attributes: attributes)
    self.attributedText = attributedString
  }
}
