//
//  CodeNSLayoutConstraintViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 15.10.2022.
//

import UIKit

/// Screen with code constraints.
final class CodeNSLayoutConstraintViewController: UIViewController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let anchorTitle = "AnchorConstraint"
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
  
  // MARK: - Private visual components.
  private func setupSubviews() {
    view.backgroundColor = .white
    createCustomBackButton()
    createRightBarButtonItem()
    view.addSubview(containerView)
    containerView.addSubview(redView)
    containerView.addSubview(yellowView)
    containerView.addSubview(greenView)
  }
  
  private func setupConstraints() {
    setupConstraintsForContainerView()
    setupConstraintsForRedView()
    setupConstraintsForYellowView()
    setupConstraintsForGreenView()
  }
  
  private func setupConstraintsForContainerView() {
    NSLayoutConstraint(item: containerView,
                       attribute: .width,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .width,
                       multiplier: 1.17,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: containerView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .height,
                       multiplier: 3.32,
                       constant: 0).isActive = true
  }
  
  private func setupConstraintsForRedView() {
    NSLayoutConstraint(item: redView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: redView,
                       attribute: .width,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: redView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .height,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: redView,
                       attribute: .centerY,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .centerY,
                       multiplier: 0.35,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: redView,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
  }
  
  private func setupConstraintsForYellowView() {
    NSLayoutConstraint(item: yellowView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .width,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: yellowView,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: view,
                       attribute: .centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: yellowView,
                       attribute: .centerY,
                       relatedBy: .equal,
                       toItem: view,
                       attribute: .centerY,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: yellowView,
                       attribute: .centerY,
                       relatedBy: .equal,
                       toItem: containerView,
                       attribute: .centerY,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: yellowView,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: containerView,
                       attribute: .centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: yellowView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: view,
                       attribute: .height,
                       multiplier: 0.118483,
                       constant: 0).isActive = true
  }
  
  private func setupConstraintsForGreenView() {
    NSLayoutConstraint(item: greenView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: greenView,
                       attribute: .width,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: greenView,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: greenView,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .height,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: greenView,
                       attribute: .centerY,
                       relatedBy: .equal,
                       toItem: yellowView,
                       attribute: .centerY,
                       multiplier: 1.65,
                       constant: 0).isActive = true
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
    let anchorVC = AnchorViewController()
    anchorVC.title = Constants.anchorTitle
    navigationController?.pushViewController(anchorVC, animated: true)
  }
}
