//
//  SignUpViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Sign up to service screen.
final class SignUpViewController: UIViewController {
  
  // MARK: - Private enums.
  private enum LocaleID {
    static let rus = "rus"
  }
  
  private enum ConfigurationForAlerts {
    static let emptyTitle = " "
    static let signUpMessage = "Вы записались на "
    static let prepositionIn = " в "
  }
  
  // MARK: - Private IBOutlet.
  @IBOutlet private weak var nameServiceLabel: UILabel!
  @IBOutlet private weak var signUpPicker: UIDatePicker!
  
  // Received data.
  var orderedService = String()
  
  // MARK: - Life circle.
  override func viewDidLoad() {
    super.viewDidLoad()
    configureAddedService()
  }
  
  // MARK: - Visual Components.
  private func configureAddedService() {
    nameServiceLabel.text = orderedService
  }
  
  // MARK: - Private Actions.
  @IBAction private func signUpAction(_ sender: Any) {
    let timeFormatter = DateFormatter()
    let dateFormatter = DateFormatter()
    timeFormatter.locale = Locale(identifier: LocaleID.rus)
    dateFormatter.locale = Locale(identifier: LocaleID.rus)
    dateFormatter.dateStyle = .short
    timeFormatter.timeStyle = .short
    
    let signUpTime = timeFormatter.string(from: signUpPicker.date)
    let signUpDate = dateFormatter.string(from: signUpPicker.date)
    signUpAlert(title: ConfigurationForAlerts.emptyTitle,
                message: ConfigurationForAlerts.signUpMessage +
                signUpDate +
                ConfigurationForAlerts.prepositionIn +
                signUpTime,
                style: .actionSheet)
  }
}
