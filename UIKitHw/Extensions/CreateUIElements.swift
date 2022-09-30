//
//  CreateUIElements.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 29.09.2022.
//

import UIKit

/// Extension with create sample UI elements for DetailViewController.
extension DetailPizzaViewController {
  func createIngredientsLabels(label: UILabel, frameY: Int, title: String) {
    label.frame = CGRect(x: 16, y: frameY, width: 176, height: 40)
    label.text = title
    label.textAlignment = .center
    label.font = UIFont(name: "Arial", size: 20)
    view.addSubview(label)
  }
  
  func createSwitch(ingredientSwitch: UISwitch, frameY: Int) {
    ingredientSwitch.frame = CGRect(x: 275, y: frameY, width: 49, height: 31)
    ingredientSwitch.setOn(false, animated: true)
    view.addSubview(ingredientSwitch)
  }
}

/// Extension with create sample UI elements for PaymentViewController.
extension PaymentViewController {
  func createPaymentMethodLabel(payLabel: UILabel, title: String, frameY: Int) {
    payLabel.frame = CGRect(x: 70, y: frameY, width: 180, height: 30)
    payLabel.text = title
    payLabel.textColor = .darkGray
    payLabel.textAlignment = .left
    payLabel.font = UIFont(name: "Arial Bold", size: 23)
    view.addSubview(payLabel)
  }
  
  func createPayMethodSwitch(paySwitch: UISwitch, frameY: Int) {
    paySwitch.frame = CGRect(x: 300, y: frameY, width: 49, height: 31)
    paySwitch.setOn(false, animated: true)
    view.addSubview(paySwitch)
  }
}
