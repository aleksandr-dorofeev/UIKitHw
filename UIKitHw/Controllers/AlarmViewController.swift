//
//  AlarmViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 01.10.2022.
//

import UIKit

/// Alarm screen.
final class AlarmViewController: UIViewController {
  
  // MARK: - IBOutlets.
  @IBOutlet weak var configureAlarmView: UIView!
  @IBOutlet weak var firstAlarmView: UIView!
  @IBOutlet weak var secondAlarmView: UIView!
  @IBOutlet weak var thirdAlarmView: UIView!
  
  // MARK: - viewDidAppear.
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    addBordersToViews()
  }
  
  // MARK: - Configure views.
  private func addBordersToViews() {
    configureAlarmView.addTopBorder()
    configureAlarmView.addBottomBorder()
    firstAlarmView.addTopBorder()
    firstAlarmView.addBottomBorder()
    secondAlarmView.addBottomBorder()
    thirdAlarmView.addBottomBorder()
  }
}
