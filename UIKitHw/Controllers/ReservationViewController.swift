//
//  ReservationViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 23.09.2022.
//

import UIKit

/// Reservation screen.
class ReservationViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func issueCheck(_ sender: Any) {
    let confirmAlert = UIAlertController(title: "Выставить чек?",
                                         message: " ",
                                         preferredStyle: .alert)
    
    let issueCheckAction = UIAlertAction(title: "Чек",
                                         style: .default,
                                         handler: { _ in
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let checkVc = storyboard.instantiateViewController(withIdentifier: "CheckViewController") as UIViewController
      checkVc.view.backgroundColor = .white
      checkVc.title = "Check"
      self.navigationController?.pushViewController(checkVc, animated: true)
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    confirmAlert.addAction(issueCheckAction)
    confirmAlert.addAction(cancelAction)
    present(confirmAlert, animated: true)
    
  }
}
