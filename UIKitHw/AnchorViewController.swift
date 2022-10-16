//
//  AnchorViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 15.10.2022.
//

import UIKit

/// Screen with anchors constraints.
final class AnchorViewController: UIViewController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let stackViewTitle = "StackViewConstraint"
    static let forwardTitle = "chevron.forward"
  }
  
  // MARK: - Private visual components.
  private let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .black
    return view
  }()
  
  private let redView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemRed
    return view
  }()
  
  private let yellowView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemYellow
    return view
  }()
  
  private let greenView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGreen
    return view
  }()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setupConstraints()
  }
  
  // MARK: - Setup private visual components.
  private func setupSubviews() {
    view.backgroundColor = .white
    view.addSubview(containerView)
    containerView.addSubview(redView)
    containerView.addSubview(yellowView)
    containerView.addSubview(greenView)
    createRightBarButtonItem()
    createCustomBackButton()
  }
  
  private func setupConstraints() {
    setupConstraintsForContainerView()
    setupConstraintsForRedView()
    setupConstraintsForYellowView()
    setupConstraintsForGreenView()
  }
  
  private func setupConstraintsForContainerView() {
    NSLayoutConstraint.activate([
      containerView.widthAnchor
        .constraint(equalTo: yellowView.widthAnchor, multiplier: 1.17),
      containerView.heightAnchor
        .constraint(equalTo: yellowView.heightAnchor, multiplier: 3.32)
    ])
  }
  
  private func setupConstraintsForRedView() {
    NSLayoutConstraint.activate([
      redView.heightAnchor
        .constraint(equalTo: redView.widthAnchor),
      redView.heightAnchor
        .constraint(equalTo: yellowView.heightAnchor),
      redView.centerXAnchor
        .constraint(equalTo: yellowView.centerXAnchor),
      redView.centerYAnchor
        .anchorWithOffset(to: yellowView.centerYAnchor)
        .constraint(equalTo: yellowView.heightAnchor, multiplier: 1.09)
    ])
  }
  
  private func setupConstraintsForYellowView() {
    NSLayoutConstraint.activate([
      yellowView.heightAnchor
        .constraint(equalTo: yellowView.widthAnchor),
      yellowView.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
      yellowView.centerYAnchor
        .constraint(equalTo: view.centerYAnchor),
      yellowView.centerYAnchor
        .constraint(equalTo: containerView.centerYAnchor),
      yellowView.centerXAnchor
        .constraint(equalTo: containerView.centerXAnchor),
      yellowView.heightAnchor
        .constraint(equalTo: view.heightAnchor, multiplier: 0.118483)
    ])
  }
  
  private func setupConstraintsForGreenView() {
    NSLayoutConstraint.activate([
      greenView.heightAnchor
        .constraint(equalTo: greenView.widthAnchor),
      greenView.centerXAnchor
        .constraint(equalTo: yellowView.centerXAnchor),
      greenView.heightAnchor
        .constraint(equalTo: yellowView.heightAnchor),
      greenView.centerYAnchor
        .anchorWithOffset(to: yellowView.centerYAnchor)
        .constraint(equalTo: yellowView.heightAnchor, multiplier: -1.09)
    ])
  }
  
  private func createCustomBackButton() {
    navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    navigationController?.navigationBar.tintColor = .black
  }
  
  private func createRightBarButtonItem() {
    let forwardItem = UIBarButtonItem(image: UIImage(systemName: Constants.forwardTitle),
                                      style: .plain,
                                      target: self,
                                      action: #selector(goForwardItemAction))
    navigationItem.rightBarButtonItems = [forwardItem]
  }
  
  // MARK: - Private actions.
  @objc private func goForwardItemAction() {
    let stackViewVC = StackViewConstraintsViewController()
    stackViewVC.title = Constants.stackViewTitle
    navigationController?.pushViewController(stackViewVC, animated: true)
  }
}
