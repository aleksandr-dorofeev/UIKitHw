//
//  Extensions.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 24.09.2022.
//

import UIKit

/// Extensions for Person picker logic.
/// DataSource.
extension PersonViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch pickerView.tag {
    case 1:
      return 100
    case 2:
      return Gender.allCases.count
    default:
      return 1
    }
  }
}

/// Delegate.
extension PersonViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch pickerView.tag {
    case 1:
      return "\(row)"
    case 2:
      return genderList[row]
    default:
      return "Empty"
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch pickerView.tag {
    case 1:
      ageTextField.text = "\(row)"
      view.endEditing(true)
    case 2:
      genderTextField.text = genderList[row]
      view.endEditing(true)
    default:
      break
    }
  }
}
