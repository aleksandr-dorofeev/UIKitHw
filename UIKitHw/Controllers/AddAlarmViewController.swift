//
//  AddAlarmViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Screen with add new alarm.
final class AddAlarmViewController: UIViewController {
  
  /// Configure time picker for infinite picker.(Не доделал).
  enum Configuration {
    static let numberOfUnits = 3
    static let pickerViewRows = 10_000
    static let loopingMargin = 40
    static let numberOfHours = Array(00...23)
    static let numberOfMin = Array(00...59)
    static let pickerViewHoursMiddle = ((pickerViewRows / numberOfHours.count) / 2) * numberOfHours.count
    static let pickerViewMinutesMiddle = ((pickerViewRows / numberOfMin.count) / 2) * numberOfMin.count
  }
  
  // MARK: - Public Properties.
  var hour = 0
  var minutes = 0
  
  // MARK: - Private IBOutlets.
  @IBOutlet private weak var alarmTimePicker: UIDatePicker!
  @IBOutlet private weak var repeatButton: UIButton!
  @IBOutlet private weak var labelButton: UIButton!
  @IBOutlet private weak var melodyButton: UIButton!
  @IBOutlet private weak var repeatSignalButton: UIButton!
  
  // MARK: - Lifecycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Private methods.
  private func setupSubviews() {
    addBordersForButtons()
  }
  
  private func addBordersForButtons() {
    repeatButton.addBottomBorder()
    labelButton.addBottomBorder()
    melodyButton.addBottomBorder()
  }
}
