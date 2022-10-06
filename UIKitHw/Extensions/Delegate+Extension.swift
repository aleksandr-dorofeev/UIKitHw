//
//  Delegate+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// UIPickerViewDelegate.
extension ConfigurationViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView,
                  didSelectRow row: Int,
                  inComponent components: Int) {
    let colorValue = DefaultValues.colors[row]
    guard pickerView == colorPicker else { return }
    textLabel.textColor = colorValue
  }
  
  func pickerView(_ pickerView: UIPickerView,
                  titleForRow row: Int,
                  forComponent components: Int) -> String? {
    guard pickerView == colorPicker else {
      let numberOfLineString = String(DefaultValues.numbersOfLine[row])
      return numberOfLineString
    }
    let nameOfColor = DefaultValues.nameOfColors[row]
    return nameOfColor
  }
}
