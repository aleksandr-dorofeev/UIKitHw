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
  
  // MARK: - IBOutlets.
  @IBOutlet weak var alarmTimePicker: UIDatePicker!
  @IBOutlet weak var repeatButton: UIButton!
  @IBOutlet weak var labelButton: UIButton!
  @IBOutlet weak var melodyButton: UIButton!
  @IBOutlet weak var repeatSignalButton: UIButton!
  
  // Values for timer picker.
  var hour = 0
  var minutes = 0
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Setup Subviews.
  private func setupSubviews() {
    addBordersForButtons()
  }
  
  // MARK: - Create Subviews.
  private func addBordersForButtons() {
    repeatButton.addBottomBorder()
    labelButton.addBottomBorder()
    melodyButton.addBottomBorder()
  }
}
