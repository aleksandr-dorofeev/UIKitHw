//
//  ServiceListViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Service list screen.
final class ServiceListViewController: UIViewController {
  
  // MARK: - Private enums.
  private enum Constans {
    static let nextString = "\n"
    static let priceLabel = " - цена "
  }
  
  // MARK: - Public properties.
  var totalServiceOrder = String()
  
  // MARK: - Private IBOutlet.
  @IBOutlet private weak var complexView: UIView!
  @IBOutlet private weak var shaveView: UIView!
  @IBOutlet private weak var cutView: UIView!
  @IBOutlet private weak var manCutLabel: UILabel!
  @IBOutlet private weak var priceManCutLabel: UILabel!
  @IBOutlet private weak var shaveLabel: UILabel!
  @IBOutlet private weak var priceShaveLabel: UILabel!
  @IBOutlet private weak var complexLabel: UILabel!
  @IBOutlet private weak var complexButton: UIButton!
  @IBOutlet private weak var priceComplexLabel: UILabel!
  @IBOutlet private weak var shaveButton: UIButton!
  @IBOutlet private weak var cutButton: UIButton!
  @IBOutlet private weak var addedServiceLabel: UILabel!
  
  // MARK: - Life circle.
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Private actions.
  @IBAction private func addManCutAction(_ sender: Any) {
    complexView.alpha = 0.1
    complexButton.isEnabled = false
    guard
      let manCutService = manCutLabel.text,
      let manCutPrice = priceManCutLabel.text
    else { return }
    totalServiceOrder += manCutService + Constans.priceLabel + manCutPrice + Constans.nextString
    addedServiceLabel.text = totalServiceOrder
  }
  
  @IBAction private func addShaveAction(_ sender: Any) {
    complexView.alpha = 0.1
    complexButton.isEnabled = false
    guard
      let shaveService = shaveLabel.text,
      let shavePrice = priceShaveLabel.text
    else { return }
    totalServiceOrder += shaveService + Constans.priceLabel + shavePrice + Constans.nextString
    addedServiceLabel.text = totalServiceOrder
  }
  
  @IBAction private func addComplexAction(_ sender: Any) {
    cutView.alpha = 0.1
    shaveView.alpha = 0.1
    cutButton.isEnabled = false
    shaveButton.isEnabled = false
    guard
      let complexService = complexLabel.text,
      let complexPrice = priceComplexLabel.text
    else { return }
    totalServiceOrder += complexService + Constans.priceLabel + complexPrice + Constans.nextString
    addedServiceLabel.text = totalServiceOrder
  }
  
  @IBAction private func signUpAction(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: StoryboardsIDs.main, bundle: nil)
    guard
      let signUpVC = storyboard.instantiateViewController(
        withIdentifier: StoryboardsIDs.signUpId) as? SignUpViewController
    else {
      return
    }
    signUpVC.orderedService = totalServiceOrder
    navigationController?.pushViewController(signUpVC, animated: true)
  }
}
