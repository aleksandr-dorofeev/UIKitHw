//
//  BagViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 26.09.2022.
//

import UIKit

/// Screen with added products.
class BagViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var addedProductImageView = UIImageView()
  lazy var addedProductNameLabel = UILabel()
  lazy var addedProductAmountLabel = UILabel()
  lazy var addedProductAmountValueLabel = UILabel()
  lazy var addedProductSizeLabel = UILabel()
  lazy var addedProductSizeValueLabel = UILabel()
  lazy var addedProductColorLabel = UILabel()
  lazy var addedProductColorValueLabel = UILabel()
  lazy var addedProductCostLabel = UILabel()
  lazy var addedProductCostValueLabel = UILabel()
  lazy var borderedLineLabel = UILabel()
  lazy var wayToGetLabel = UILabel()
  lazy var wayToGetValueLabel = UILabel()
  lazy var generalCostLabel = UILabel()
  lazy var generalCostValueLabel = UILabel()
  lazy var byeButton = UIButton()
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Setup Subviews.
  private func setupSubviews() {
    createAddedImageView()
    createAddedNameLabel()
    createAmountLabel()
    createAmountValueLabel()
    createSizeLabel()
    createSizeValueLabel()
    createColorLabel()
    createColorValueLabel()
    createCostLabel()
    createBorderLineLabel()
    createWayToGetLabel()
    createGeneralCostLabel()
    createCostValueLabel()
    createWayToGetValueLabel()
    createGeneralCostValueLabel()
    createByeButton()
  }
  
  // MARK: - Create Subviews.
  private func createAddedImageView() {
    addedProductImageView.frame = CGRect(x: 16, y: 90, width: 100, height: 100)
    addedProductImageView.contentMode = .scaleAspectFit
    view.addSubview(addedProductImageView)
  }
  
  private func createAddedNameLabel() {
    addedProductNameLabel.frame = CGRect(x: 124, y: 90, width: 220, height: 25)
    addedProductNameLabel.font = .boldSystemFont(ofSize: 16)
    addedProductNameLabel.textAlignment = .center
    view.addSubview(addedProductNameLabel)
  }
  
  private func createAmountLabel() {
    addedProductAmountLabel.frame = CGRect(x: 124, y: 117, width: 100, height: 20)
    addedProductAmountLabel.text = "Количество:"
    addedProductAmountLabel.textAlignment = .left
    view.addSubview(addedProductAmountLabel)
  }
  
  private func createAmountValueLabel() {
    addedProductAmountValueLabel.frame = CGRect(x: 274, y: 116, width: 100, height: 20)
    addedProductAmountValueLabel.font = .boldSystemFont(ofSize: 15)
    addedProductAmountValueLabel.textAlignment = .right
    view.addSubview(addedProductAmountValueLabel)
  }
  
  private func createSizeLabel() {
    addedProductSizeLabel.frame = CGRect(x: 124, y: 145, width: 100, height: 20)
    addedProductSizeLabel.text = "Размер:"
    addedProductSizeLabel.textAlignment = .left
    view.addSubview(addedProductSizeLabel)
  }
  
  private func createSizeValueLabel() {
    addedProductSizeValueLabel.frame = CGRect(x: 274, y: 144, width: 100, height: 20)
    addedProductSizeValueLabel.font = .boldSystemFont(ofSize: 15)
    addedProductSizeValueLabel.textAlignment = .right
    view.addSubview(addedProductSizeValueLabel)
  }
  
  private func createColorLabel() {
    addedProductColorLabel.frame = CGRect(x: 124, y: 170, width: 100, height: 20)
    addedProductColorLabel.text = "Цвет:"
    addedProductColorLabel.textAlignment = .left
    view.addSubview(addedProductColorLabel)
  }
  
  private func createColorValueLabel() {
    addedProductColorValueLabel.frame = CGRect(x: 274, y: 170, width: 100, height: 20)
    addedProductColorValueLabel.font = .boldSystemFont(ofSize: 15)
    addedProductColorValueLabel.textAlignment = .right
    view.addSubview(addedProductColorValueLabel)
  }
  
  private func createCostLabel() {
    addedProductCostLabel.frame = CGRect(x: 16, y: 221, width: 56, height: 21)
    addedProductCostLabel.text = "Цена:"
    addedProductCostLabel.font = .boldSystemFont(ofSize: 15)
    addedProductCostLabel.textAlignment = .left
    view.addSubview(addedProductCostLabel)
  }
  
  private func createCostValueLabel() {
    addedProductCostValueLabel.frame = CGRect(x: 80, y: 221, width: 56, height: 21)
    addedProductCostValueLabel.font = .boldSystemFont(ofSize: 15)
    addedProductCostValueLabel.textAlignment = .right
    view.addSubview(addedProductCostValueLabel)
  }
  
  private func createBorderLineLabel() {
    borderedLineLabel.frame = CGRect(x: 16, y: 239, width: 358, height: 20)
    borderedLineLabel.text = "________________________________________"
    borderedLineLabel.textColor = .lightGray
    view.addSubview(borderedLineLabel)
  }
  
  private func createWayToGetLabel() {
    wayToGetLabel.frame = CGRect(x: 16, y: 607, width: 160, height: 40)
    wayToGetLabel.text = "Способ получения:"
    wayToGetLabel.font = .boldSystemFont(ofSize: 15)
    wayToGetLabel.textAlignment = .left
    view.addSubview(wayToGetLabel)
  }
  
  private func createWayToGetValueLabel() {
    wayToGetValueLabel.frame = CGRect(x: 214, y: 607, width: 160, height: 40)
    wayToGetValueLabel.font = .boldSystemFont(ofSize: 15)
    wayToGetValueLabel.textAlignment = .right
    view.addSubview(wayToGetValueLabel)
  }
  
  private func createGeneralCostLabel() {
    generalCostLabel.frame = CGRect(x: 16, y: 682, width: 100, height: 40)
    generalCostLabel.text = "Итого:"
    generalCostLabel.font = .boldSystemFont(ofSize: 15)
    generalCostLabel.textAlignment = .left
    view.addSubview(generalCostLabel)
  }
  
  private func createGeneralCostValueLabel() {
    generalCostValueLabel.frame = CGRect(x: 214, y: 682, width: 160, height: 40)
    generalCostValueLabel.font = .boldSystemFont(ofSize: 20)
    generalCostValueLabel.textAlignment = .left
    view.addSubview(generalCostValueLabel)
  }
  
  private func createByeButton() {
    byeButton.frame = CGRect(x: 16, y: 760, width: 358, height: 50)
    byeButton.backgroundColor = .black
    byeButton.layer.cornerRadius = 3
    byeButton.setTitle("Купить", for: .normal)
    byeButton.titleLabel?.textColor = .white
    view.addSubview(byeButton)
  }
}
