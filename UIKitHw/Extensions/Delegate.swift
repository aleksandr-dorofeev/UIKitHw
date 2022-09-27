//
//  Delegate.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 27.09.2022.
//

import UIKit

/// Extension for size and amount pickers delegate.
extension ProductViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      switch pickerView.tag {
      case 1:
        return "\(row)"
      case 2:
        return "\(sneaker.size[row])"
      default:
        return "Empty"
      }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      switch pickerView.tag {
      case 1:
        productAmountTextField.text = "\(row)"
      case 2:
        productSizeTextField.text = "\(sneaker.size[row])"
      default:
        break
      }
    }
}
