//
//  HomeWorkViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 27.09.2022.
//

import UIKit

/// Screen with homework.
class HomeWorkViewController: UIViewController {
  
  // MARK: - Outlets.
  @IBOutlet weak var shareTextFIeld: UITextField!
  @IBOutlet weak var shareToFacebook: UITextField!
  @IBOutlet weak var locationTextField: UITextField!
  @IBOutlet weak var locationPicker: UIPickerView!
  @IBOutlet weak var chelseaImage: UIImageView!
  @IBOutlet weak var shareMessageWithImage: UITextField!
  
  // MARK: - ActivityController.
  var activityController: UIActivityViewController?
  
  // MARK: - Cities list.
  var cities = ["Tbilisi", "Erevan", "Moscow", "Vologda", "Ivanovo", "Praga", "Belgrade", "Budapesht"]
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Actions.
  @IBAction func shareButton(_ sender: Any) {
    let text = shareTextFIeld.text
    
    if (text?.isEmpty) == true {
      let message = "Введите информацию, которой хотите поделиться."
      
      let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      
      alertController.addAction(alertAction)
      present(alertController, animated: true, completion: nil)
    }
    
    activityController = UIActivityViewController(activityItems: [shareTextFIeld.text ?? "nil"],
                                                  applicationActivities: nil)
    guard let activity = activityController else { return }
    present(activity, animated: true)
  }
  
  @IBAction func shareToFacebookAction(_ sender: Any) {
    guard let shareText = shareToFacebook.text else { return }
    guard let urlText = URL(string: shareText) else { return }
    activityController = UIActivityViewController(activityItems: [urlText],
                                                  applicationActivities: nil)
    guard let activity = activityController else { return }
    present(activity, animated: true)
  }
  
  @IBAction func shareImageAction(_ sender: Any) {
    guard let imageItem = chelseaImage.image else { return }
    guard let messageItem = shareMessageWithImage.text else { return }
    activityController = UIActivityViewController(activityItems: [imageItem, messageItem],
                                                  applicationActivities: nil)
    guard let activity = activityController else { return }
    present(activity, animated: true)
  }
}

extension HomeWorkViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return cities[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    locationTextField.text = "\(cities[row])"
    activityController = UIActivityViewController(activityItems: [locationTextField.text ?? "nil"],
                                                  applicationActivities: nil)
    guard let activity = activityController else { return }
    present(activity, animated: true)
  }
}

extension HomeWorkViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return cities.count
  }
}
