//
//  CaloriesViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 30.09.2022.
//

import UIKit

/// Calories Screen.
final class CaloriesViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var pizzaLabel = UILabel()
  lazy var compoundLabel = UILabel()
  lazy var caloriesLabel = UILabel()
  lazy var dismissButton = UIButton()
  
  // Variables for transfer data.
  var pizzaName: String?
  var compound: String?
  var calories: String?
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpSubviews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpSubviews() {
    createBackgroundColor()
    createPizzaLabel()
    createCompoundLabel()
    createCaloriesLabel()
    createDismissButton()
  }
  
  // MARK: - Create Subviews.
  private func createBackgroundColor() {
    view.backgroundColor = .white
  }
  
  private func createPizzaLabel() {
    pizzaLabel.frame = CGRect(x: 16, y: 80, width: 358, height: 50)
    pizzaLabel.text = pizzaName
    pizzaLabel.textAlignment = .center
    pizzaLabel.textColor = .lightGray
    pizzaLabel.font = UIFont(name: "Arial Bold", size: 25)
    view.addSubview(pizzaLabel)
  }
  
  private func createCompoundLabel() {
    compoundLabel.frame = CGRect(x: 16, y: 138, width: 358, height: 123)
    compoundLabel.text = "Состав: \(compound ?? "")"
    compoundLabel.textAlignment = .left
    compoundLabel.numberOfLines = 0
    compoundLabel.textColor = .gray
    compoundLabel.font = UIFont(name: "Arial Bold", size: 15)
    view.addSubview(compoundLabel)
  }
  
  private func createCaloriesLabel() {
    caloriesLabel.frame = CGRect(x: 16, y: 269, width: 358, height: 123)
    caloriesLabel.text = "Калорийность: \(calories ?? "")"
    caloriesLabel.textAlignment = .left
    caloriesLabel.numberOfLines = 0
    caloriesLabel.textColor = .gray
    caloriesLabel.font = UIFont(name: "Arial Bold", size: 15)
    view.addSubview(caloriesLabel)
  }
  
  private func createDismissButton() {
    dismissButton.frame = CGRect(x: 0, y: 32, width: 70, height: 40)
    dismissButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    dismissButton.tintColor = .systemOrange
    dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    view.addSubview(dismissButton)
  }
  
  // MARK: - Actions.
  @objc private func dismissAction() {
    dismiss(animated: true)
  }
}
