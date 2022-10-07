//
//  HomeWorkViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Replay lesson screen.
final class HomeWorkViewController: UIViewController {
  
  // MARK: - Private enum.
  private enum Constants {
    static let defaultText = "Some text"
  }
  
  // MARK: - Private properties.
  private var myTextView = UITextView()
  
  // MARK: - Life circle.
  override func viewDidLoad() {
    super.viewDidLoad()
    createNotificationForTextView()
    createTextView()
  }
  
  // MARK: Override func.
  override func touchesBegan(_ touchesSet: Set<UITouch>, with event: UIEvent?) {
    myTextView.resignFirstResponder()
    myTextView.backgroundColor = .white
  }
  
  // MARK: - Visual components.
  private func createNotificationForTextView() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(updateTextViewAction),
                                           name: UIResponder.keyboardDidShowNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(updateTextViewAction),
                                           name: UIResponder.keyboardWillHideNotification,
                                           object: nil)
  }
  
  private func createTextView() {
    myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 50, height: view.bounds.height / 2))
    myTextView.text = Constants.defaultText
    myTextView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    myTextView.font = UIFont.systemFont(ofSize: 17)
    myTextView.backgroundColor = .gray
    view.addSubview(myTextView)
  }
  
  // MARK: - Private actions.
  @objc func updateTextViewAction(param: Notification) {
    guard let userInfo = param.userInfo else { return }
    let defaultCGRectValue = CGRect(x: 1, y: 1, width: 1, height: 1)
    let getKeyboardRect = (
      userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? defaultCGRectValue
    let keyboardFrame = view.convert(getKeyboardRect, to: view.window)
    
    if param.name == UIResponder.keyboardWillHideNotification {
      myTextView.contentInset = UIEdgeInsets.zero
    } else {
      myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
      myTextView.scrollIndicatorInsets = myTextView.contentInset
    }
    myTextView.scrollRangeToVisible(myTextView.selectedRange)
  }
}
