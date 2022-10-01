//
//  FoodViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Food screen.
final class FoodViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var pizzaButton = UIButton()
  lazy var sushiButton = UIButton()
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpViews() {
    createBackgroundColor()
    createPizzaButton()
    createSushiButton()
  }
  
  // MARK: - Create Subviews.
  private func createBackgroundColor() {
    view.backgroundColor = .white
  }
  
  private func createPizzaButton() {
    pizzaButton.frame = CGRect(x: 0, y: 100, width: 350, height: 150)
    pizzaButton.center.x = view.center.x
    pizzaButton.layer.borderWidth = 0.5
    pizzaButton.setTitle("Пицца", for: .normal)
    pizzaButton.setTitleColor( .black, for: .normal)
    pizzaButton.titleLabel?.font = UIFont(name: "Arial", size: 20)
    pizzaButton.backgroundColor = .clear
    pizzaButton.titleLabel?.textAlignment = .center
    pizzaButton.addTarget(self, action: #selector(pizzaAction), for: .touchUpInside)
    view.addSubview(pizzaButton)
  }
  
  private func createSushiButton() {
    sushiButton.frame = CGRect(x: 0, y: 300, width: 350, height: 150)
    sushiButton.center.x = view.center.x
    sushiButton.layer.borderWidth = 0.5
    sushiButton.layer.borderColor = UIColor.red.cgColor
    sushiButton.setTitle("Суши", for: .normal)
    sushiButton.setTitleColor( .black, for: .normal)
    sushiButton.titleLabel?.font = UIFont(name: "Arial", size: 20)
    sushiButton.backgroundColor = .clear
    sushiButton.titleLabel?.textAlignment = .center
    sushiButton.addTarget(self, action: #selector(sushiAction), for: .touchUpInside)
    view.addSubview(sushiButton)
  }
  
  // MARK: - Actions.
  @objc private func sushiAction() {
    errorAlert(title: ":(", message: "На данный момент товар закончился", style: .alert)
  }
  
  @objc private func pizzaAction() {
    let pizzaList = PizzaViewController()
    pizzaList.title = "Pizza"
    navigationController?.pushViewController(pizzaList, animated: true)
  }
}
