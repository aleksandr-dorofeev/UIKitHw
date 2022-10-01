//
//  DetailPizzaViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Ingredients pizza screen.
final class DetailPizzaViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var detailImageView = UIImageView()
  lazy var detailNameLabel = UILabel()
  lazy var cheeseLabel = UILabel()
  lazy var humLabel = UILabel()
  lazy var mushroomLabel = UILabel()
  lazy var olivesLabel = UILabel()
  lazy var cheeseSwitch = UISwitch()
  lazy var humSwitch = UISwitch()
  lazy var mushroomSwitch = UISwitch()
  lazy var olivesSwitch = UISwitch()
  lazy var caloriesButton = UIButton()
  lazy var choiceButton = UIButton()
  
  // Variables for transfer data.
  var pizza: Pizza?
  
  lazy var goToBack2 = {
    guard let viewController = self.presentingViewController as? UINavigationController else { return }
    self.view.isHidden = true
    self.dismiss(animated: false)
    viewController.popToRootViewController(animated: false)
  }
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpSubviews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpSubviews() {
    createBackgroundColor()
    createDetailTitleLabel()
    createDetailImageView()
    createCheeseStack()
    createHamStack()
    createMushroomStack()
    createOlivesStack()
    createCaloriesButton()
    createChoiceButton()
  }
  
  // MARK: - Create Subviews.
  private func createBackgroundColor() {
    view.backgroundColor = .white
  }
  
  private func createDetailImageView() {
    detailImageView.frame = CGRect(x: 16, y: 105, width: 358, height: 265)
    detailImageView.image = UIImage(named: pizza?.image ?? " ")
    detailImageView.contentMode = .scaleAspectFit
    view.addSubview(detailImageView)
  }
  
  private func createDetailTitleLabel() {
    detailNameLabel.frame = CGRect(x: 16, y: 47, width: 358, height: 50)
    detailNameLabel.text = pizza?.name
    detailNameLabel.textAlignment = .center
    detailNameLabel.font = UIFont(name: "Arial", size: 25)
    detailNameLabel.textColor = .systemGray
    view.addSubview(detailNameLabel)
  }
  
  private func createCheeseStack() {
    createIngredientsLabels(label: cheeseLabel, frameY: 402, title: "Сыр 'Моцарела'")
    createSwitch(ingredientSwitch: cheeseSwitch, frameY: 407)
  }
  
  private func createHamStack() {
    createIngredientsLabels(label: humLabel, frameY: 450, title: "Ветчина")
    createSwitch(ingredientSwitch: humSwitch, frameY: 455)
  }
  
  private func createMushroomStack() {
    createIngredientsLabels(label: mushroomLabel, frameY: 498, title: "Грибы")
    createSwitch(ingredientSwitch: mushroomSwitch, frameY: 503)
  }
  
  private func createOlivesStack() {
    createIngredientsLabels(label: olivesLabel, frameY: 546, title: "Маслины")
    createSwitch(ingredientSwitch: olivesSwitch, frameY: 551)
  }
  
  private func createChoiceButton() {
    choiceButton.frame = CGRect(x: 60, y: 650, width: 272, height: 35)
    choiceButton.backgroundColor = .systemOrange
    choiceButton.setTitle( "Выбрать", for: .normal)
    choiceButton.tintColor = .white
    choiceButton.layer.cornerRadius = 6
    choiceButton.addTarget(self, action: #selector(choiceAction), for: .touchUpInside)
    view.addSubview(choiceButton)
  }
  
  private func createCaloriesButton() {
    caloriesButton.frame = CGRect(x: 0, y: 600, width: 150, height: 35)
    caloriesButton.center.x = view.center.x
    caloriesButton.backgroundColor = .systemOrange
    caloriesButton.setTitle( "Калории", for: .normal)
    caloriesButton.tintColor = .white
    caloriesButton.layer.cornerRadius = 6
    caloriesButton.addTarget(self, action: #selector(caloriesAction), for: .touchUpInside)
    view.addSubview(caloriesButton)
  }
  
  private func updateIngredientsState() {
    pizza?.isCheese = cheeseSwitch.isOn
    pizza?.isHum = humSwitch.isOn
    pizza?.isMushrooms = mushroomSwitch.isOn
    pizza?.isOlives = olivesSwitch.isOn
  }
  
  private func transferIngredientsToPaymentScreen() -> String {
    var totalOrder = String()
    var numberIngredient = 1
    guard let ingredients = pizza else { return "" }
    totalOrder += ingredients.isCheese ? "\(numberIngredient) Сыр Моцарела\n" : ""
    numberIngredient += 1
    totalOrder += ingredients.isHum ? "\(numberIngredient) Ветчина\n" : ""
    numberIngredient += 1
    totalOrder += ingredients.isMushrooms ? "\(numberIngredient) Грибы\n" : ""
    numberIngredient += 1
    totalOrder += ingredients.isOlives ? "\(numberIngredient) Маслины\n" : ""
    if totalOrder.isEmpty {
      totalOrder += "Дополнительные ингредиенты отсутствуют."
    }
    return totalOrder
  }
  
  // MARK: - Actions.
  @objc private func choiceAction() {
    updateIngredientsState()
    let paymentVC = PaymentViewController()
    paymentVC.nameOrder = pizza?.name
    paymentVC.orderedProducts = transferIngredientsToPaymentScreen()
    paymentVC.delegate = self
    let secondNavigationController = UINavigationController(rootViewController: paymentVC)
    secondNavigationController.modalPresentationStyle = .fullScreen
    paymentVC.title = "Оплата"
    present(secondNavigationController, animated: true)
  }
  
  @objc private func caloriesAction() {
    let caloriesVC = CaloriesViewController()
    caloriesVC.pizzaName = pizza?.name
    caloriesVC.compound = pizza?.compound ?? ""
    caloriesVC.calories = pizza?.calories ?? ""
    caloriesVC.modalPresentationStyle = .formSheet
    present(caloriesVC, animated: true)
  }
}
