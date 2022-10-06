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
    let fonts = [Constants.arialHebrewFont, Constants.gothicNeoFont, Constants.courierFont, Constants.typewriterFont, Constants.helveticaNeueFont, Constants.didotFont]
    switch keys[row] {
    case let fontName where fontName == Constants.arialHebrewFont:
      changeFontAndSizeAction(name: fontName, isBold: false)
    case let fontName where fontName == Constants.gothicNeoFont:
      changeFontAndSizeAction(name: fontName, isBold: false)
    case let fontName where fontName == Constants.courierFont:
      changeFontAndSizeAction(name: fontName, isBold: false)
    case let fontName where fontName == Constants.typewriterFont:
      changeFontAndSizeAction(name: fontName, isBold: false)
    case let fontName where fontName == Constants.helveticaNeueFont:
      changeFontAndSizeAction(name: fontName, isBold: false)
    case let fontName where fontName == Constants.didotFont:
      changeFontAndSizeAction(name: fontName, isBold: false)
    default:
      break
    }
    currentFont = keys[row]
  }
}
