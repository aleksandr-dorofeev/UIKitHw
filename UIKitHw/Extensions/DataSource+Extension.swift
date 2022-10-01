//
//  DataSource+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Data source extension.
extension ConfigurationViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView,
                  numberOfRowsInComponent component: Int) -> Int {
    guard pickerView == colorPicker else { return numbersOfLine.count }
    return colors.count
  }
}
