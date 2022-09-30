//
//  PizzaViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Pizza screen.
final class PizzaViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var margaritaImageView = UIImageView()
  lazy var pepperoniImageView = UIImageView()
  lazy var margaritaLabel = UILabel()
  lazy var pepperoniLabel = UILabel()
  lazy var margaritaButton = UIButton()
  lazy var pepperoniButton = UIButton()
  
  var pizza: [Pizza] = [
    Pizza(name: "Маргарита",
          image: "margarita",
          compound: "Дрожжевое тесто, сливочное масло, альпийский сыр, базилик, фирменный соус, томаты",
          calories: " 357 калорий на 100 грамм."),
    Pizza(name: "Пепперони",
          image: "pepperoni",
          compound: "Дрожжевое тесто, сливочное масло, альпийский сыр, томатная паста, пепперони, острый перец",
          calories: "383 калорий на 100 грамм")]
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpViews() {
    createBackgroundColor()
    createCustomBackButton()
    createMargaritaImageView()
    createPepperoniImageView()
    createMargaritaLabel()
    createPepperoniLabel()
    createMargaritaButton()
    createPepperoniButton()
  }
  
  // MARK: - Create Subviews.
  private func createBackgroundColor() {
    view.backgroundColor = .white
  }
  
  private func createCustomBackButton() {
    navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    navigationController?.navigationBar.tintColor = .black
  }
  
  private func createMargaritaImageView() {
    margaritaImageView.frame = CGRect(x: 16, y: 108, width: 150, height: 150)
    margaritaImageView.image = UIImage(named: pizza.first?.image ?? " ")
    margaritaImageView.contentMode = .scaleAspectFit
    view.addSubview(margaritaImageView)
  }
  
  private func createPepperoniImageView() {
    pepperoniImageView.frame = CGRect(x: 16, y: 294, width: 150, height: 150)
    pepperoniImageView.image = UIImage(named: pizza.last?.image ?? " ")
    pepperoniImageView.contentMode = .scaleAspectFit
    view.addSubview(pepperoniImageView)
  }
  
  private func createMargaritaLabel() {
    margaritaLabel.frame = CGRect(x: 174, y: 158, width: 142, height: 50)
    margaritaLabel.text = pizza.first?.name ?? " "
    margaritaLabel.textAlignment = .left
    margaritaLabel.font = UIFont(name: "Arial", size: 20)
    view.addSubview(margaritaLabel)
  }
  
  private func createPepperoniLabel() {
    pepperoniLabel.frame = CGRect(x: 174, y: 344, width: 142, height: 50)
    pepperoniLabel.text = pizza.last?.name ?? " "
    pepperoniLabel.textAlignment = .left
    pepperoniLabel.font = UIFont(name: "Arial", size: 20)
    view.addSubview(pepperoniLabel)
  }
  
  private func createMargaritaButton() {
    margaritaButton.frame = CGRect(x: 324, y: 158, width: 50, height: 50)
    margaritaButton.backgroundColor = .systemOrange
    margaritaButton.setTitle( "+", for: .normal)
    margaritaButton.tintColor = .white
    margaritaButton.layer.cornerRadius = 8
    margaritaButton.addTarget(self, action: #selector(margaritaAction), for: .touchUpInside)
    view.addSubview(margaritaButton)
  }
  
  private func createPepperoniButton() {
    pepperoniButton.frame = CGRect(x: 324, y: 344, width: 50, height: 50)
    pepperoniButton.backgroundColor = .systemOrange
    pepperoniButton.setTitle( "+", for: .normal)
    pepperoniButton.tintColor = .white
    pepperoniButton.layer.cornerRadius = 8
    pepperoniButton.addTarget(self, action: #selector(pepperoniAction), for: .touchUpInside)
    view.addSubview(pepperoniButton)
  }
  
  // MARK: - Actions.
  @objc private func margaritaAction() {
    let detailVC = DetailPizzaViewController()
    detailVC.pizza = pizza.first
    formSheetPresentViewController(view: detailVC)
  }
  
  @objc private func pepperoniAction() {
    let detailVC = DetailPizzaViewController()
    detailVC.pizza = pizza.last
    formSheetPresentViewController(view: detailVC)
  }
}
