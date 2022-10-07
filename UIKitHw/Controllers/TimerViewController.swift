//
//  TimerViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 05.10.2022.
//

import UIKit

/// Timer screen.
final class TimerViewController: UIViewController {
  
  // MARK: - Private enum.
  private enum Constants {
    static let timerCounterStartPosition = 0.00
    static let interval = 0.01
    static let customRedColor = UIColor(red: 0.666, green: 0.335, blue: 0.338, alpha: 1)
    static let customGreenColor = UIColor(red: 0.486, green: 0.666, blue: 0.459, alpha: 1)
    static let stopTitle = "Стоп"
    static let startTitle = "Старт"
    static let startPositionTitle = "0:00:00"
    static let zero = "0"
  }
  
  // MARK: - Private IBOutlet.
  @IBOutlet private weak var stopwatchLabel: UILabel!
  @IBOutlet private weak var resetButton: UIButton!
  @IBOutlet private weak var startPauseButton: UIButton!
  
  // MARK: - Private properties.
  private var isStart = Bool()
  private var isTimerRun = false
  private var timer: Timer?
  private var timerCounter = Constants.timerCounterStartPosition
  
  // MARK: - Private actions.
  @IBAction func startPauseAction(_ sender: UIButton) {
    if isStart == false {
      timer = Timer.scheduledTimer(timeInterval: Constants.interval,
                                   target: self,
                                   selector: #selector(runTimerAction),
                                   userInfo: nil,
                                   repeats: true)
      sender.setTitle(Constants.stopTitle, for: .normal)
      sender.backgroundColor = Constants.customRedColor
      isStart = true
    } else if isStart == true {
      sender.setTitle(Constants.startTitle, for: .normal)
      sender.backgroundColor = Constants.customGreenColor
      timer?.invalidate()
      isStart = false
    }
  }
  
  @IBAction func resetAction(_ sender: UIButton) {
    timerCounter = 0.00
    stopwatchLabel.text = Constants.startPositionTitle
  }
  
  @objc private func runTimerAction() {
    timerCounter += 0.01
    stopwatchLabel.text = "\(timerCounter)"
    let flooredCounter = Int(timerCounter)
    let hour = flooredCounter / 3600
    let minute = (flooredCounter % 3600) / 60
    let minuteText = addZeroBeforeAction(minute)
    let seconds = (flooredCounter % 3600) % 60
    let secondText = addZeroBeforeAction(seconds)
    stopwatchLabel.text = "\(hour):\(minuteText):\(secondText)"
  }
  
  private func addZeroBeforeAction(_ value: Int) -> String {
    value < 10 ? "\(Constants.zero)\(value)" : "\(value)"
  }
}
