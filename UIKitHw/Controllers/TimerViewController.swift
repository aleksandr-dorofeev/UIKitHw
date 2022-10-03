//
//  TimerViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Timer screen.
final class TimerViewController: UIViewController {
  
  // MARK: - Enums for constants.
  enum TimeUnits {
    static let hour = "ч"
    static let minute = "мин"
    static let second = "с"
  }
  
  enum NumberOfUnits {
    static let numberOfUnits = 3
    static let numberOfHours = 25
    static let numberOfMinAndSec = 60
  }
  
  // MARK: - IBOutlets.
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var cancellationButton: UIButton!
  @IBOutlet weak var timePicker: UIPickerView!
  
  // Values for timer picker.
  var hour = 0
  var minutes = 0
  var seconds = 0
}
