//
//  PaymentViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 28.09.2022.
//

import UIKit

/// Payment screen.
final class PaymentViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var yourOrderLabel = UILabel()
  lazy var billListLabel = UILabel()
  lazy var cardLabel = UILabel()
  lazy var cashLabel = UILabel()
  lazy var cardSwitch = UISwitch()
  lazy var cashSwitch = UISwitch()
  lazy var payButton = UIButton(configuration: .filled())
  
  // Delegate for pop VC.
  weak var delegate: Returnable?
  
  // Variables for transfer data.
  var nameOrder: String?
  var orderedProducts: String?
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpSubviews()
  }
  
  // MARK: - Setup Subviews.
  private func setUpSubviews() {
    createBackgroundColor()
    createOrderLabel()
    createBillLabel()
    createCardStack()
    createCashStack()
    createPayButton()
  }
  
  // MARK: - Create Subviews.
  private func createBackgroundColor() {
    view.backgroundColor = .white
  }
  
  private func createOrderLabel() {
    yourOrderLabel.frame = CGRect(x: 16, y: 82, width: 358, height: 50)
    yourOrderLabel.text = nameOrder
    yourOrderLabel.textAlignment = .center
    yourOrderLabel.textColor = .lightGray
    yourOrderLabel.font = UIFont(name: "Arial Bold", size: 25)
    view.addSubview(yourOrderLabel)
  }
  private func createBillLabel() {
    billListLabel.frame = CGRect(x: 16, y: 140, width: 360, height: 340)
    billListLabel.text = orderedProducts
    billListLabel.textColor = .darkGray
    billListLabel.textAlignment = .left
    billListLabel.numberOfLines = 0
    billListLabel.font = UIFont(name: "Arial Bold", size: 25)
    view.addSubview(billListLabel)
  }
  
  private func createCardStack() {
    createPaymentMethodLabel(payLabel: cardLabel, title: "Карта", frameY: 560)
    createPayMethodSwitch(paySwitch: cardSwitch, frameY: 560)
  }
  
  private func createCashStack() {
    createPaymentMethodLabel(payLabel: cashLabel, title: "Наличные", frameY: 600)
    createPayMethodSwitch(paySwitch: cashSwitch, frameY: 600)
  }
  
  private func createPayButton() {
    payButton.frame = CGRect(x: 60, y: 700, width: 272, height: 35)
    payButton.backgroundColor = .black
    payButton.setTitle("  Pay", for: .normal)
    payButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
    payButton.tintColor = .black
    payButton.layer.cornerRadius = 4
    payButton.addTarget(self, action: #selector(payAction), for: .touchUpInside)
    view.addSubview(payButton)
  }
  
  // MARK: - Actions.
  @objc private func payAction() {
    if !cardSwitch.isOn && !cashSwitch.isOn {
      errorAlert(title: "", message: "Выберите способ оплаты.", style: .alert)
    }
    let deliveryMessage = "Ваш заказ доставят в течение 15 минут! \nПриятного аппетита."
    if cardSwitch.isOn {
      paymentAlert(title: "Заказ оплачен", message: deliveryMessage, style: .alert)
    } else {
      let pickupMessage = "Ваш заказ будет готов к выдаче в течение 10 минут! \nПриятного аппетита."
      paymentAlert(title: "Заказ оплачен", message: pickupMessage, style: .alert)
    }
  }
}
