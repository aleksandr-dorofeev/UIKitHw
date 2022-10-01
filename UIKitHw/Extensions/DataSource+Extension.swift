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
    let numbersOfPicker = 1
    return numbersOfPicker
  }
  
  func pickerView(_ pickerView: UIPickerView,
                  numberOfRowsInComponent component: Int) -> Int {
    let amountOfLines = DefaultValues.numbersOfLine.count
    let amountColors = DefaultValues.colors.count
    guard pickerView == colorPicker else { return amountOfLines }
    return amountColors
  }
}
