//
//  GoToRoot+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 29.09.2022.
//

import UIKit

/// Extension with pop to root logic.
extension DetailPizzaViewController: ReturnableDelegate {
  func goToRoot() {
    guard let viewController = self.presentingViewController as? UINavigationController else { return }
    view.isHidden = true
    dismiss(animated: false)
    viewController.popToRootViewController(animated: false)
  }
}
