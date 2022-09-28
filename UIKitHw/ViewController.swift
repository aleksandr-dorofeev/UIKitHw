//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Screen with repeat lesson. .
class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: - Constant.
  let textField = UITextField()
  let pushButton = UIButton()
  
  // MARK: - Variables.
  var shareButton = UIButton()
  var activityViewController: UIActivityViewController?
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    createTextField()
    createShareButton()
    createPushButton()
  }
  
  // MARK: - Methods.
  func createTextField() {
    textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
    textField.center = view.center
    textField.borderStyle = .roundedRect
    textField.delegate = self
    textField.placeholder = "Enter your information..."
    view.addSubview(textField)
  }
  
  func createShareButton() {
    shareButton = UIButton(type: .roundedRect)
    shareButton.frame = CGRect(x: 50, y: 350, width: 280, height: 45)
    shareButton.setTitle("Share", for: .normal)
    shareButton.addTarget(self, action: #selector(handleShareAction), for: .touchUpInside)
    view.addSubview(shareButton)
  }
  
  func createPushButton() {
    pushButton.frame = CGRect(x: 0, y: 600, width: 150, height: 50)
    pushButton.center.x = view.center.x
    pushButton.setTitle("Homework ->", for: .normal)
    pushButton.setTitleColor(.systemBlue, for: .normal)
    pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
    view.addSubview(pushButton)
  }
  
  // MARK: - Action.
  @objc func handleShareAction(paramSender: Any) {
    let text = textField.text
    
    if (text?.isEmpty) == true {
      let message = "Early enter text and push button"
      
      let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      
      alertController.addAction(alertAction)
      present(alertController, animated: true, completion: nil)
    }
    
    activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"],
                                                      applicationActivities: nil)
    guard let activity = activityViewController else { return }
    present(activity, animated: true, completion: nil)
  }
  
  @objc func pushButtonAction() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let homeworkVc = storyboard.instantiateViewController(withIdentifier: "homework")
    homeworkVc.title = "Домашняя работа"
    navigationController?.pushViewController(homeworkVc, animated: true)
  }
  
  // MARK: - UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
