//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Replay lesson.
final class HomeworkViewController: UIViewController {
  
  // MARK: - Private properties.
  private var myButton = UIButton()
  private let normalImage = UIImage(named: "1")
  private let highlightedImage = UIImage(named: "2")
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    createButton()
  }
  
  // MARK: - Private visual components.
  private func createButton() {
    myButton = UIButton(type: .roundedRect)
    myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 100)
    myButton.setBackgroundImage(normalImage, for: .normal)
    myButton.setBackgroundImage(highlightedImage, for: .highlighted)
    myButton.setTitle("1", for: .normal)
    myButton.setTitle("2", for: .highlighted)
    myButton.addTarget(self, action: #selector(buttonIsPressedAction), for: .touchDown)
    myButton.addTarget(self, action: #selector(buttonIsTappedAction), for: .touchUpInside)
    view.addSubview(myButton)
  }
  
  // MARK: - Provate actions.
  @objc private func buttonIsPressedAction(sender: UIButton) {
    print("Button is pressed")
  }
  
  @objc private func buttonIsTappedAction(sender: UIButton) {
    print("Button is tapped")
  }
}
