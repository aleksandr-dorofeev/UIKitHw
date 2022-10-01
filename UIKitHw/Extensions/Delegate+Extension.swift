//
//  Delegate+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Delegate extension for timer.
extension TimerViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    let widthOfComponent = timePicker.frame.size.width / 3
    return widthOfComponent
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch component {
    case 0:
      return "\(row) \(TimeUnits.hour)"
    case 1:
      return "\(row) \(TimeUnits.minute)"
    case 2:
      return "\(row) \(TimeUnits.second)"
    default:
      return ""
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch component {
    case 0:
      hour = row
    case 1:
      minutes = row
    case 2:
      seconds = row
    default:
      break
    }
  }
}
