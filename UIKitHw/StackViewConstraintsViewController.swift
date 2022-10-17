//
//  StackViewConstraintsViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 15.10.2022.
//

import UIKit

/// Screen with stack view constraints.
final class StackViewConstraintsViewController: UIViewController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let backwardTitle = "chevron.backward"
  }
  
  // MARK: - Private visual components.
  private let redView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemRed
    return view
  }()
  
  private let yellowView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemYellow
    return view
  }()
  
  private let greenView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGreen
    return view
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.backgroundColor = .label
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.isLayoutMarginsRelativeArrangement = true
    return stackView
  }()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    createCustomBackButton()
    setupSubviews()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setupConstraints()
    addMarginStackView()
  }
  
  // MARK: - Setup private visual components.
  private func setupSubviews() {
    view.backgroundColor = .white
    view.addSubview(stackView)
  }
  
  private func createCustomBackButton() {
    navigationItem.setHidesBackButton(true, animated: true)
    let backButton = UIBarButtonItem(image: UIImage(systemName: Constants.backwardTitle),
                                     style: .plain,
                                     target: self,
                                     action: #selector(backwardAction))
    navigationItem.leftBarButtonItem = backButton
  }
  
  private func setupConstraints() {
    setupConstraintsForStackView()
  }
  
  private func setupConstraintsForStackView() {
    NSLayoutConstraint.activate([
      stackView.heightAnchor
        .constraint(equalTo: view.heightAnchor, multiplier: 0.4),
      stackView.widthAnchor
        .constraint(equalTo: stackView.heightAnchor, multiplier: 1/3),
      stackView.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor
        .constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  private func addMarginStackView() {
    let marginSize = view.frame.height / 99
    stackView.spacing = marginSize
    stackView.layoutMargins = UIEdgeInsets(top: marginSize,
                                           left: marginSize,
                                           bottom: marginSize,
                                           right: marginSize)
  }
  
  // MARK: - Private actions.
  @objc private func backwardAction() {
    navigationController?.popToRootViewController(animated: false)
  }
}
