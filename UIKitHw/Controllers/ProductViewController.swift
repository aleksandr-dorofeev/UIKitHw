//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Screen with product description..
class ProductViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var productImageView = UIImageView()
  lazy var productNameLabel = UILabel()
  lazy var productSizeLabel = UILabel()
  lazy var productSizeTextField = UITextField()
  lazy var productDeliveryLabel = UILabel()
  lazy var productDeliveryStateSwitch = UISwitch()
  lazy var productColorLabel = UILabel()
  lazy var productColorSegmentControl = UISegmentedControl()
  lazy var productCostLabel = UILabel()
  lazy var productCostValueLabel = UILabel()
  lazy var addProductButton = UIButton()
  lazy var productAmountLabel = UILabel()
  lazy var productAmountTextField = UITextField()
  lazy var amountPicker = UIPickerView()
  lazy var sizePicker = UIPickerView()
  
  // Counter for add product screen.
  var productCount = false
  
  // Collections of images.
  var images = [UIImage(named: sneaker.image.first ?? ""),
                UIImage(named: sneaker.image[1]),
                UIImage(named: sneaker.image.last ?? "")]
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpSubViews()
  }
  
  // MARK: - Setup subviews.
  private func setUpSubViews() {
    createNameLabel()
    createProductImageView()
    createSegmentControl()
    createSizeLabel()
    createDeliveryLabel()
    createColorLabel()
    createCostLabel()
    createSizeTextField()
    createDeliverySwitch()
    createSegmentControl()
    createCostValueLabel()
    createProductAmountLabel()
    createProductAmountTextField()
    createProductAmountLabel()
    createProductAmountTextField()
    createAddBagButton()
    createBarButtonBag()
  }
  
  // MARK: - Actions.
  @objc func createSizeAndAmountPickerAction() {
    let toolBar = UIToolbar()
    toolBar.sizeToFit()
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerAction))
    toolBar.setItems([doneButton], animated: true)
    setUpDelegateAndDataSourceForPickers()
    setupIndexesForPickers()
    productAmountTextField.inputView = amountPicker
    productSizeTextField.inputView = sizePicker
    productAmountTextField.inputAccessoryView = toolBar
    productSizeTextField.inputAccessoryView = toolBar
  }
  
  @objc func pickerAction() {
    view.endEditing(true)
  }
  
  @objc func selectedValueAction(target: UISegmentedControl) {
    if target == productColorSegmentControl {
      let segmentIndex = target.selectedSegmentIndex
      productImageView.image = images[segmentIndex]
    }
  }
  
  @objc func barButtonBagAction() {
    guard productCount == false else {
      let bagVc = BagViewController()
      guard let selectColor = productColorSegmentControl.titleForSegment(
        at: productColorSegmentControl.selectedSegmentIndex) else { return }
      bagVc.addedProductNameLabel.text = productNameLabel.text
      bagVc.addedProductCostValueLabel.text = productCostValueLabel.text
      bagVc.addedProductImageView.image = productImageView.image
      bagVc.addedProductSizeValueLabel.text = productSizeTextField.text
      bagVc.addedProductColorValueLabel.text = selectColor
      if productDeliveryStateSwitch.isOn {
        bagVc.wayToGetValueLabel.text = "Доставка"
      } else {
        bagVc.wayToGetValueLabel.text = "Самовывоз"
      }
      bagVc.addedProductAmountValueLabel.text = productAmountTextField.text
      guard let amountInt = Int(productAmountTextField.text ?? "") else { return }
      guard let costInt = Int(productCostValueLabel.text ?? "") else { return }
      bagVc.generalCostValueLabel.text = "\(amountInt * costInt) рублей"
      navigationController?.pushViewController(bagVc, animated: true)
      return }
    errorAlert(title: "Ой",
               message: "Пока вы еще ничего не добавили в корзину.",
               style: .alert)
  }
  
  @objc func addButtonAction() {
    productCount = true
  }
  
  // MARK: - Create Subviews.
  private func createSizeTextField() {
    productSizeTextField.frame = CGRect(x: 172, y: 455, width: 202, height: 34)
    productSizeTextField.placeholder = "Выберите размер..."
    productSizeTextField.textAlignment = .center
    productSizeTextField.addTarget(self, action: #selector(createSizeAndAmountPickerAction), for: .touchDown)
    view.addSubview(productSizeTextField)
  }
  
  private func createDeliverySwitch() {
    productDeliveryStateSwitch.frame = CGRect(x: 250, y: 509, width: 49, height: 31)
    productDeliveryStateSwitch.setOn(false, animated: true)
    view.addSubview(productDeliveryStateSwitch)
  }
  
  private func createSegmentControl() {
    productColorSegmentControl = UISegmentedControl(items: sneaker.colors)
    productColorSegmentControl.frame = CGRect(x: 208, y: 558, width: 150, height: 31)
    productColorSegmentControl.addTarget(self, action: #selector(selectedValueAction), for: .valueChanged)
    view.addSubview(productColorSegmentControl)
  }
  
  private func createCostValueLabel() {
    productCostValueLabel.frame = CGRect(x: 220, y: 602, width: 131, height: 41)
    productCostValueLabel.text = sneaker.cost
    productCostValueLabel.textAlignment = .center
    view.addSubview(productCostValueLabel)
  }
  
  private func createNameLabel() {
    productNameLabel.frame = CGRect(x: 16, y: 406, width: 358, height: 41)
    productNameLabel.text = sneaker.name
    productNameLabel.font = UIFont(name: "Arial", size: 20)
    productNameLabel.textAlignment = .center
    view.addSubview(productNameLabel)
  }
  
  private func createSizeLabel() {
    productSizeLabel.frame = CGRect(x: 16, y: 455, width: 83, height: 41)
    productSizeLabel.text = "Размер"
    view.addSubview(productSizeLabel)
  }
  
  private func createDeliveryLabel() {
    productDeliveryLabel.frame = CGRect(x: 16, y: 504, width: 83, height: 41)
    productDeliveryLabel.text = "Доставка"
    view.addSubview(productDeliveryLabel)
  }
  
  private func createColorLabel() {
    productColorLabel.frame = CGRect(x: 16, y: 553, width: 83, height: 41)
    productColorLabel.text = "Цвет"
    view.addSubview(productColorLabel)
  }
  
  private func createCostLabel() {
    productCostLabel.frame = CGRect(x: 16, y: 602, width: 87, height: 41)
    productCostLabel.text = "Стоимость"
    view.addSubview(productCostLabel)
  }
  
  private func createProductImageView() {
    productImageView.frame = CGRect(x: 16, y: 47, width: 358, height: 336)
    productImageView.contentMode = .scaleAspectFit
    guard let image = images.first else { return }
    productImageView.image = image
    view.addSubview(productImageView)
  }
  
  private func createBarButtonBag() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "basketIcon"),
                                                        style: .done,
                                                        target: self,
                                                        action: #selector(barButtonBagAction))
  }
  
  private func createAddBagButton() {
    addProductButton.frame = CGRect(x: 16, y: 760, width: 358, height: 50)
    addProductButton.backgroundColor = .black
    addProductButton.layer.cornerRadius = 3
    addProductButton.setTitle("Добавить в Корзину", for: .normal)
    addProductButton.titleLabel?.textColor = .white
    addProductButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    view.addSubview(addProductButton)
  }
  
  private func createProductAmountLabel() {
    productAmountLabel.frame = CGRect(x: 16, y: 651, width: 94, height: 41)
    productAmountLabel.text = "Количество"
    view.addSubview(productAmountLabel)
  }
  
  private func createProductAmountTextField() {
    productAmountTextField.frame = CGRect(x: 190, y: 654, width: 190, height: 34)
    productAmountTextField.placeholder = "Выберите количество..."
    productAmountTextField.textAlignment = .center
    productAmountTextField.addTarget(self, action: #selector(createSizeAndAmountPickerAction), for: .touchDown)
    view.addSubview(productAmountTextField)
  }
  
  private func setupIndexesForPickers() {
    amountPicker.tag = 1
    sizePicker.tag = 2
   }
  
  private func setUpDelegateAndDataSourceForPickers() {
    amountPicker.dataSource = self
    amountPicker.delegate = self
    sizePicker.dataSource = self
    sizePicker.delegate = self
  }
}
