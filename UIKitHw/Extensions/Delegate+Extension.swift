//
//  Delegate+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import UIKit

/// UIPickerViewDelegate.
extension BookViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    var keys: [String] = []
    for font in Fonts.fonts {
      keys.append(font.key)
    }
    return keys[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    var keys: [String] = []
    for font in Fonts.fonts {
      keys.append(font.key)
    }
    currentFont = keys[row]
    changeFontAndSizeAction(name: currentFont, isBold: false)
  }
}
