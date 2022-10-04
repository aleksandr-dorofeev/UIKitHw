//
//  Alert+Extension.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Alert extension.
extension UIViewController {
  
  // MARK: - Public Enums.
  enum StoryboardsIDs {
    static let main = "Main"
    static let navigationId = "navigationID"
    static let signUpId = "signUpID"
  }
  
  // MARK: - Private Enums.
  private enum ConfigurationForAlerts {
    static let okButton = "Ok"
  }
  
  // MARK: - Public methods.
  func errorAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: ConfigurationForAlerts.okButton, style: .default)
    alert.addAction(action)
    present(alert, animated: true)
  }
  
  func successAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: ConfigurationForAlerts.okButton, style: .cancel) { _ in
      let storyboard = UIStoryboard(name: StoryboardsIDs.main, bundle: nil)
      guard
        let serviceScreen = storyboard.instantiateViewController(
          withIdentifier: StoryboardsIDs.navigationId) as? UINavigationController
      else {
        return
      }
      serviceScreen.modalPresentationStyle = .fullScreen
      self.present(serviceScreen, animated: true)
    }
    alert.addAction(action)
    present(alert, animated: true)
  }
  
  func signUpAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: ConfigurationForAlerts.okButton, style: .cancel) { _ in
    }
    alert.addAction(action)
    present(alert, animated: true)
  }
}
