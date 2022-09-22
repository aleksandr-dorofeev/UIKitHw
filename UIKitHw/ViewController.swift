//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

// Controller.
class ViewController: UIViewController {
  
  // MARK: - Constants.
  private let sumLabel = UILabel()
  private let guessLabel = UILabel()
  private let helloLabel = UILabel()
  
  private let sumButton: UIButton = {
    var button = UIButton()
    button.frame = CGRect(x: 20, y: 300, width: 150, height: 50)
    button.layer.cornerRadius = 2
    button.layer.borderWidth = 0.5
    button.setTitle("Addition", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .clear
    return button
  }()
  
  private let guessButton: UIButton = {
    let button = UIButton()
    button.frame = CGRect(x: 220, y: 300, width: 150, height: 50)
    button.layer.cornerRadius = 2
    button.layer.borderWidth = 0.5
    button.setTitle("Guess", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .clear
    return button
  }()
  
  private let navigateToMVCButton: UIButton = {
    let button = UIButton()
    button.frame = CGRect(x: 220, y: 700, width: 150, height: 50)
    button.layer.cornerRadius = 2
    button.layer.borderWidth = 0.5
    button.setTitle("MVC ->", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .clear
    return button
  }()
  
  // MARK: - ViewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    createHelloLabel()
    createSumLabel()
    createGuessLabel()
    configGuessButton()
    configSumButton()
    configNavigateButton()
  }
  
  // MARK: - ViewDidAppear.
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    onboardingAlert()
  }
  
  // MARK: - Create Labels.
  private func createHelloLabel() {
    helloLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
    helloLabel.layer.cornerRadius = 6
    helloLabel.layer.borderWidth = 0.5
    helloLabel.textAlignment = .center
    helloLabel.text = "Hello Guest!"
    helloLabel.center.x = self.view.center.x
    view.addSubview(helloLabel)
  }
  
  private func createSumLabel() {
    sumLabel.frame = CGRect(x: 20, y: 220, width: 150, height: 50)
    sumLabel.layer.cornerRadius = 6
    sumLabel.layer.borderWidth = 0.5
    sumLabel.textAlignment = .center
    view.addSubview(sumLabel)
  }
  
  private func createGuessLabel() {
    guessLabel.frame = CGRect(x: 220, y: 220, width: 150, height: 50)
    guessLabel.layer.cornerRadius = 6
    guessLabel.layer.borderWidth = 0.5
    guessLabel.textAlignment = .center
    guessLabel.numberOfLines = 0
    guessLabel.font = guessLabel.font.withSize(10)
    view.addSubview(guessLabel)
  }
  
  // MARK: - Configs for buttons.
  private func configGuessButton() {
    guessButton.addTarget(self, action: #selector(guessAlert), for: .touchUpInside)
    view.addSubview(guessButton)
  }
  
  private func configSumButton() {
    sumButton.addTarget(self, action: #selector(sumAlert), for: .touchUpInside)
    view.addSubview(sumButton)
  }
  
  private func configNavigateButton() {
    navigateToMVCButton.addTarget(self, action: #selector(presentMvcController), for: .touchUpInside)
    view.addSubview(navigateToMVCButton)
  }
  
  // MARK: - Actions.
  @objc private func sumAlert() {
    let sumAlert = UIAlertController(title: "Addition",
                                     message: "Enter the numbers you want to add.",
                                     preferredStyle: .alert)
    
    sumAlert.addTextField { textField1 in
      textField1.placeholder = "Enter first number..."
    }
    
    sumAlert.addTextField { textField2 in
      textField2.placeholder = "Enter second number..."
    }
    
    sumAlert.addAction(UIAlertAction(title: "Addition",
                                     style: .default,
                                     handler: { _ in
      let firstField = sumAlert.textFields?.first?.text
      let secondField = sumAlert.textFields?.last?.text
      let intFirstField = Int(firstField ?? "You add incorrect number")
      let intSecondField = Int(secondField ?? "You add incorrect number")
      guard let firstNum = intFirstField else { return }
      guard let secondNum = intSecondField else { return }
      let sum = firstNum + secondNum
      self.sumLabel.text = String(sum)
    }))
    present(sumAlert, animated: true)
  }
  
  @objc private func guessAlert() {
    let guessAlert = UIAlertController(title: "\(helloLabel.text ?? "Hey Guest!")",
                                       message: "Guess the number from 1 to 10",
                                       preferredStyle: .alert)
    
    guessAlert.addTextField { textField in
      textField.placeholder = "Enter Your Name..."
    }
    
    guessAlert.addAction(UIAlertAction(title: "Ok",
                                       style: .default,
                                       handler: { _ in
      let answer = guessAlert.textFields?.first
      let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      guard let randomNumber = numbers.randomElement() else { return }
      if randomNumber == Int(answer?.text ?? "No value!") {
        self.guessLabel.text = "You guessed the number: \(String(describing: randomNumber))"
      } else {
        self.guessLabel.text = "You didn't guess the number, Correct number: \(String(describing: randomNumber))"
      }
    }))
    present(guessAlert, animated: true)
  }
  
  @objc private func presentMvcController() {
    let helloViewController = HelloViewController()
    helloViewController.modalPresentationStyle = .fullScreen
    self.present(helloViewController, animated: true, completion: nil)
  }
  
  // MARK: - Welcome Alert.
  private func onboardingAlert() {
    let onboardingAlert = UIAlertController(title: "Welcome, Guest!",
                                            message: "Enter your name, please!",
                                            preferredStyle: .alert)
    
    onboardingAlert.addTextField { textField in
      textField.placeholder = "Enter Your Name..."
    }
    
    let action = UIAlertAction(title: "Ok",
                               style: .default,
                               handler: { _ in
      let name = onboardingAlert.textFields?.first?.text
      guard let nameText = name else { return }
      self.helloLabel.text = "Hello \(nameText)"
    })
    onboardingAlert.addAction(action)
    present(onboardingAlert, animated: true)
  }
}
