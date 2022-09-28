//
//  DataSource.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 27.09.2022.
//

import UIKit

/// UIPickerViewDataSource.
extension ProductViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
     }
    
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch pickerView.tag {
    case 1:
      return 11
    case 2:
      return sneaker.size.count
    default:
      return 1
    }
  }
}
