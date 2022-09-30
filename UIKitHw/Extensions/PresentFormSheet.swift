//
//  PresentFormSheet.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 29.09.2022.
//

import UIKit

/// Extension for present form sheet.
extension PizzaViewController {
  func formSheetPresentViewController(view: UIViewController) {
    view.modalPresentationStyle = .formSheet
    present(view, animated: true)
  }
}
