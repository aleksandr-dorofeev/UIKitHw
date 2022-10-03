//
//  ServiceListViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Service list screen.
final class ServiceListViewController: UIViewController {

  @IBOutlet weak var complexView: UIView!
  @IBOutlet weak var shaveView: UIView!
  @IBOutlet weak var cutView: UIView!
  @IBOutlet weak var manCutLabel: UILabel!
  @IBOutlet weak var priceManCutLabel: UILabel!
  @IBOutlet weak var shaveLabel: UILabel!
  @IBOutlet weak var priceShaveLabel: UILabel!
  @IBOutlet weak var complexLabel: UILabel!
  @IBOutlet weak var complexButton: UIButton!
  @IBOutlet weak var priceComplexLabel: UILabel!
  @IBOutlet weak var shaveButton: UIButton!
  @IBOutlet weak var cutButton: UIButton!
  
  // MARK: - Life circle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  @IBAction func addManCutAction(_ sender: Any) {
    complexView.alpha = 0.1
    complexButton.isEnabled = false
    let signUpVC = SignUpViewController()
    signUpVC.service = manCutLabel.text
    signUpVC.priceForService = priceManCutLabel.text
  }
  
  @IBAction func addShaveAction(_ sender: Any) {
    complexView.alpha = 0.1
    complexButton.isEnabled = false
    let signUpVC = SignUpViewController()
    signUpVC.service = shaveLabel.text
    signUpVC.priceForService = priceShaveLabel.text
  }
  
  @IBAction func addComplexAction(_ sender: Any) {
    cutView.alpha = 0.1
    shaveView.alpha = 0.1
    cutButton.isEnabled = false
    shaveButton.isEnabled = false
    let signUpVC = SignUpViewController()
    signUpVC.service = complexLabel.text
    signUpVC.priceForService = priceComplexLabel.text
  }
}
