//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Контроллер.
class RegistrationViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func pushReservation(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let reserv = storyboard.instantiateViewController(withIdentifier: "ReservationViewController") as UIViewController
    reserv.view.backgroundColor = .white
    reserv.title = "Cafe Mario"
    self.navigationController?.pushViewController(reserv, animated: true)
  }
}
