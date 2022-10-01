//
//  Delegate+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Delegate extension.
extension ConfigurationViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView,
                  didSelectRow row: Int,
                  inComponent components: Int) {
    guard pickerView == colorPicker else { return }
    textLabel.textColor = colors[row]
  }
  
  func pickerView(_ pickerView: UIPickerView,
                  titleForRow row: Int,
                  forComponent components: Int) -> String? {
    guard pickerView == colorPicker else { return String(numbersOfLine[row]) }
    return nameOfColors[row]
  }
}
