//
//  HomeWorkViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Lesson replay screen.
class HomeWorkViewController: UIViewController, UITextFieldDelegate {
  
  var myTextField = UITextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createTextField()
    createNotificationObservers()
  }
  
  // MARK: - Create Subviews.
  private func createTextField() {
    let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
    myTextField = UITextField(frame: textFieldFrame)
    myTextField.borderStyle = .roundedRect
    myTextField.delegate = self
    myTextField.contentVerticalAlignment = .center
    myTextField.textAlignment = .center
    myTextField.placeholder = "I am SWIFT dev"
    myTextField.center = view.center
    view.addSubview(myTextField)
  }
  
  private func createNotificationObservers() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(textDidChangeNotificationAction),
                                           name: UITextField.textDidChangeNotification,
                                           object: nil)
    
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                           object: nil,
                                           queue: nil) { _ in
      self.view.frame.origin.y = -200
    }
    
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                           object: nil,
                                           queue: nil) { _ in
      self.view.frame.origin.y = 0.0
    }
  }
  
  // MARK: - UITextFieldDelegate.
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    if textField == myTextField {
      print("textFieldShouldBeginEditing = это я решаю можно ли редактировать поле")
      return true
    } else {
      return false
    }
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    print("textFieldDidBeginEditing = внимание! Началось редактирование")
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print("textFieldShouldEndEditing = внимание! Закончилось редактирование")
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    print("textFieldDidEndEditing")
  }
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    print("shouldChangeCharactersIn = вы ввели = \(string)")
    return true
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    print("textFieldShouldClear = ты что то очистил")
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("textFieldShouldReturn = хотите убрать клавиатуру")
    if textField == myTextField {
      myTextField.resignFirstResponder()
    }
    return true
  }
  
  // MARK: - Notification Action.
  @objc private func textDidChangeNotificationAction(ncParam: NSNotification ) {
    print("textDidChangeNotification = \(ncParam)")
  }
}
