//
//  DataSource+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Datasource extension for timer.
extension TimerViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return NumberOfUnits.numberOfUnits
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
    case 0:
      return NumberOfUnits.numberOfHours
    case 1, 2:
      return NumberOfUnits.numberOfMinAndSec
    default:
      return 0
    }
  }
}
