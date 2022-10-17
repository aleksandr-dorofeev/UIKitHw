//
//  UserInterfaceViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Screen with user interface constraints.
final class UserInterfaceViewController: UIViewController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let layoutConstraintsCodeTitle = "NSLayoutConstraint(Code)"
  }
  
  // MARK: - Private actions.
  @IBAction private func goForwardItemAction(_ sender: Any) {
    let codeConstraintsVC = CodeNSLayoutConstraintViewController()
    codeConstraintsVC.title = Constants.layoutConstraintsCodeTitle
    navigationController?.pushViewController(codeConstraintsVC, animated: true)
  }
}
