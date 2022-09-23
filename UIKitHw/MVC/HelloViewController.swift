//
//  HelloViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

// Controller.
class HelloViewController: UIViewController {
  
  // MARK: - Constants.
  let resultLabel = UILabel()
  
  private let beginButton: UIButton = {
    let button = UIButton()
    button.frame = CGRect(x: 220, y: 300, width: 150, height: 50)
    button.layer.cornerRadius = 2
    button.layer.borderWidth = 0.5
    button.setTitle("Begin...", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .clear
    return button
  }()
  
  // MARK: - Model.
  var model = Name()
  
  // MARK: - ViewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackgroundColor()
    setupBackgroundColor()
    createResultLabel()
    configBeginButton()
  }
  
  // MARK: - Setup backgroundColor.
  func setupBackgroundColor() {
    view.backgroundColor = .white
  }
  
  // MARK: - Create Labels.
  private func createResultLabel() {
    resultLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
    resultLabel.layer.cornerRadius = 6
    resultLabel.layer.borderWidth = 0.5
    resultLabel.textAlignment = .center
    resultLabel.text = "Result"
    resultLabel.center.x = self.view.center.x
    view.addSubview(resultLabel)
  }
  
  // MARK: - Configs for buttons.
  private func configBeginButton() {
    beginButton.addTarget(self, action: #selector(beginPlay), for: .touchUpInside)
    view.addSubview(beginButton)
  }
  
  // MARK: - Target.
  @objc private func beginPlay() {
    model.correctName(vc: self, resultLabel: resultLabel)
  }
}
