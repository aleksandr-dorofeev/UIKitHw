//
//  AlarmViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Alarm screen.
final class AlarmViewController: UIViewController {
  
  // MARK: - Private IBOutlets.
  @IBOutlet private weak var configureAlarmView: UIView!
  @IBOutlet private weak var firstAlarmView: UIView!
  @IBOutlet private weak var secondAlarmView: UIView!
  @IBOutlet private weak var thirdAlarmView: UIView!
  
  // MARK: - Lifecycle.
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    addBordersToViews()
  }
  
  // MARK: - Private methods.
  private func addBordersToViews() {
    configureAlarmView.addTopBorder()
    configureAlarmView.addBottomBorder()
    firstAlarmView.addTopBorder()
    firstAlarmView.addBottomBorder()
    secondAlarmView.addBottomBorder()
    thirdAlarmView.addBottomBorder()
  }
}
