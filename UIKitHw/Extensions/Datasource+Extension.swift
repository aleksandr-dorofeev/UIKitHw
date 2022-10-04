//
//  Datasource+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import UIKit

/// UIPickerViewDataSource.
extension BookViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    let numberOfComponents = 1
    return numberOfComponents
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return Fonts.fonts.count
  }
}
