//
//  SignUpViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 03.10.2022.
//

import UIKit

/// Sign up to service screen.
final class SignUpViewController: UIViewController {
  
  @IBOutlet weak var nameServiceLabel: UILabel! {
    willSet {
      guard var text = nameServiceLabel.text else { return }
      return text = (service ?? "") + (priceForService ?? "")
    }
  }
  @IBOutlet weak var timeLabel: UILabel!
  
  var service: String?
  var priceForService: String?

  // MARK: - Life circle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  // MARK: - Visual Components.
}
