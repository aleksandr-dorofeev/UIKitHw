//
//  HelloViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

// Screen with word input.
class HelloViewController: UIViewController {
  
  // MARK: - Constants.
  private let resultLabel = UILabel()
  private let beginButton = UIButton()
  
  // MARK: - Model for Word logic.
  private var word = Word()
  
  // MARK: - ViewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  // MARK: - Create.
  private func createResultLabel() {
    resultLabel.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
    resultLabel.layer.cornerRadius = 6
    resultLabel.layer.borderWidth = 0.5
    resultLabel.textAlignment = .center
    resultLabel.text = "Result"
    resultLabel.center.x = self.view.center.x
    view.addSubview(resultLabel)
  }
  private func createBeginButton() {
    beginButton.frame = CGRect(x: 220, y: 300, width: 150, height: 50)
    beginButton.layer.cornerRadius = 2
    beginButton.layer.borderWidth = 0.5
    beginButton.setTitle("Begin...", for: .normal)
    beginButton.setTitleColor(.black, for: .normal)
    beginButton.backgroundColor = .clear
    beginButton.addTarget(self, action: #selector(beginPlayAction), for: .touchUpInside)
    view.addSubview(beginButton)
  }
  
  // MARK: - Setup Views.
  private func setupViews() {
    view.backgroundColor = .white
    createResultLabel()
    createBeginButton()
  }
  
  // MARK: - Target.
  @objc private func beginPlayAction() {
    let alert = UIAlertController(title: "Get start",
                                  message: "Enter leohl",
                                  preferredStyle: .alert)
    alert.addTextField { textField in
      textField.placeholder = "Enter word..."
    }
    alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
      guard let text = alert.textFields?.first?.text else { return }
      self.resultLabel.text = self.word.correctWord(text: text)
      }))
    present(alert, animated: true)
  }
}
