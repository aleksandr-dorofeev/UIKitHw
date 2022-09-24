//
//  PersonViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 23.09.2022.
//

import UIKit

/// Screen with add person info.
class PersonViewController: UIViewController {
  // MARK: - Gender various.
  enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
  }
  
  // MARK: - Сollection of gender variants.
  let genderList = [Gender.male.rawValue, Gender.female.rawValue]
  
  // MARK: - Lazy properties.
  lazy var avatarImageView = UIImageView()
  lazy var nameLabel = UILabel()
  lazy var dateLabel = UILabel()
  lazy var ageLabel = UILabel()
  lazy var genderLabel = UILabel()
  lazy var instagramLabel = UILabel()
  lazy var nameTextField = UITextField()
  lazy var dateTextField = UITextField()
  lazy var ageTextField = UITextField()
  lazy var genderTextField = UITextField()
  lazy var instagramTextField = UITextField()
  lazy var changeImageButton = UIButton()
  lazy var cancelButton = UIButton()
  lazy var addButton = UIButton()
  lazy var datePicker = UIDatePicker()
  lazy var agePicker = UIPickerView()
  lazy var genderPicker = UIPickerView()
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  // MARK: - Setup Subviews.
  private func setupViews() {
    setupBackgroundColor()
    createAvatarImageView()
    createChangeImageButton()
    createNameLabel()
    createDateLabel()
    createAgeLabel()
    createGenderLabel()
    createInstagramLabel()
    createNameTextField()
    createDateTextField()
    createAgeTextField()
    createGenderTextField()
    createInstagramTextField()
    createCancelButton()
    createAddButton()
  }
  
  // MARK: - Setup backgroundColor.
  private func setupBackgroundColor() {
    view.backgroundColor = .white
  }
  
  // MARK: - Create Subviews.
  private func createAvatarImageView() {
    let image = UIImage(systemName: "person.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    avatarImageView.image = image
    avatarImageView.frame = CGRect(x: 0, y: 50, width: 120, height: 120)
    avatarImageView.center.x = view.center.x
    avatarImageView.backgroundColor = .gray
    avatarImageView.layer.borderWidth = 1.0
    avatarImageView.layer.masksToBounds = true
    avatarImageView.layer.borderColor = UIColor.white.cgColor
    avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    avatarImageView.clipsToBounds = true
    view.addSubview(avatarImageView)
  }
  
  private func createChangeImageButton() {
    changeImageButton.frame = CGRect(x: 0, y: 170, width: 100, height: 30)
    changeImageButton.center.x = view.center.x
    changeImageButton.setTitle("Change Avatar", for: .normal)
    changeImageButton.setTitleColor(.systemBlue, for: .normal)
    changeImageButton.backgroundColor = .clear
    changeImageButton.titleLabel?.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(changeImageButton)
  }
  
  private func createNameLabel() {
    nameLabel.frame = CGRect(x: 20, y: 220, width: 50, height: 30)
    nameLabel.textAlignment = .left
    nameLabel.text = "Name"
    nameLabel.textColor = .systemBlue
    nameLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(nameLabel)
  }
  
  private func createDateLabel() {
    dateLabel.frame = CGRect(x: 20, y: 300, width: 50, height: 30)
    dateLabel.textAlignment = .left
    dateLabel.text = "Date"
    dateLabel.textColor = .systemBlue
    dateLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(dateLabel)
  }
  
  private func createAgeLabel() {
    ageLabel.frame = CGRect(x: 20, y: 380, width: 50, height: 30)
    ageLabel.textAlignment = .left
    ageLabel.text = "Age"
    ageLabel.textColor = .systemBlue
    ageLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(ageLabel)
  }
  
  private func createGenderLabel() {
    genderLabel.frame = CGRect(x: 20, y: 460, width: 60, height: 30)
    genderLabel.textAlignment = .left
    genderLabel.text = "Gender"
    genderLabel.textColor = .systemBlue
    genderLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(genderLabel)
  }
  
  private func createInstagramLabel() {
    instagramLabel.frame = CGRect(x: 20, y: 540, width: 70, height: 30)
    instagramLabel.textAlignment = .left
    instagramLabel.text = "Instagram"
    instagramLabel.textColor = .systemRed
    instagramLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    view.addSubview(instagramLabel)
  }
  
  private func createNameTextField() {
    nameTextField.frame = CGRect(x: 15, y: 250, width: 350, height: 40)
    nameTextField.placeholder = "Enter your name..."
    nameTextField.font = UIFont.systemFont(ofSize: 15)
    nameTextField.borderStyle = .roundedRect
    nameTextField.autocorrectionType = .no
    nameTextField.keyboardType = .default
    nameTextField.contentVerticalAlignment = .center
    view.addSubview(nameTextField)
  }
  
  private func createDateTextField() {
    dateTextField.frame = CGRect(x: 15, y: 330, width: 350, height: 40)
    dateTextField.placeholder = "Enter your birth date..."
    dateTextField.font = UIFont.systemFont(ofSize: 15)
    dateTextField.borderStyle = .roundedRect
    dateTextField.autocorrectionType = .no
    dateTextField.keyboardType = .default
    dateTextField.contentVerticalAlignment = .center
    dateTextField.addTarget(self, action: #selector(createDatePicker), for: .touchDown)
    view.addSubview(dateTextField)
  }
  
  private func createAgeTextField() {
    ageTextField.frame = CGRect(x: 15, y: 410, width: 350, height: 40)
    ageTextField.placeholder = "Enter your age..."
    ageTextField.font = UIFont.systemFont(ofSize: 15)
    ageTextField.borderStyle = .roundedRect
    ageTextField.autocorrectionType = .no
    ageTextField.keyboardType = .default
    ageTextField.contentVerticalAlignment = .center
    ageTextField.addTarget(self, action: #selector(createPicker), for: .touchDown)
    view.addSubview(ageTextField)
  }
  
  private func createGenderTextField() {
    genderTextField.frame = CGRect(x: 15, y: 490, width: 350, height: 40)
    genderTextField.placeholder = "Enter your gender..."
    genderTextField.font = UIFont.systemFont(ofSize: 15)
    genderTextField.borderStyle = .roundedRect
    genderTextField.autocorrectionType = .no
    genderTextField.keyboardType = .default
    genderTextField.contentVerticalAlignment = .center
    genderTextField.addTarget(self, action: #selector(createPicker), for: .touchDown)
    view.addSubview(genderTextField)
  }
  
  private func createInstagramTextField() {
    instagramTextField.frame = CGRect(x: 15, y: 570, width: 350, height: 40)
    instagramTextField.placeholder = "Do you have instagram?"
    instagramTextField.font = UIFont.systemFont(ofSize: 15)
    instagramTextField.borderStyle = .roundedRect
    instagramTextField.autocorrectionType = .no
    instagramTextField.keyboardType = .default
    instagramTextField.contentVerticalAlignment = .center
    instagramTextField.addTarget(self, action: #selector(instagramAction), for: .touchDown)
    view.addSubview(instagramTextField)
  }
  
  private func createCancelButton() {
    cancelButton.frame = CGRect(x: 5, y: 10, width: 100, height: 30)
    cancelButton.setTitle("Cancel", for: .normal)
    cancelButton.setTitleColor(.systemBlue, for: .normal)
    cancelButton.backgroundColor = .clear
    cancelButton.titleLabel?.font = UIFont(name: "Arial Hebrew", size: 20)
    cancelButton.addTarget(self, action: #selector(cancelPersonAction), for: .touchUpInside)
    view.addSubview(cancelButton)
  }
  
  private func createAddButton() {
    addButton.frame = CGRect(x: 300, y: 10, width: 100, height: 30)
    addButton.setTitle("Add", for: .normal)
    addButton.setTitleColor(.systemBlue, for: .normal)
    addButton.backgroundColor = .clear
    addButton.titleLabel?.font = UIFont(name: "Arial Hebrew", size: 20)
    view.addSubview(addButton)
  }
  
  // MARK: - Actions.
  @objc func pickerAction() {
    view.endEditing(true)
  }
  
  @objc func cancelDateAction() {
    self.view.endEditing(true)
  }
  
  @objc func createPicker() {
    let toolBar = UIToolbar()
    toolBar.sizeToFit()
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerAction))
    toolBar.setItems([doneButton], animated: true)
    setUpDelegateAndDataSourceForPickers()
    setupIndexesForPickers()
    ageTextField.inputView = agePicker
    genderTextField.inputView = genderPicker
    ageTextField.inputAccessoryView = toolBar
    genderTextField.inputAccessoryView = toolBar
  }
  
  @objc func dateChange(datePicker: UIDatePicker) {
    dateTextField.text = formatDate(date: datePicker.date)
  }
  
  @objc func createDatePicker() {
    datePicker.datePickerMode = .dateAndTime
    let toolBar = UIToolbar()
    toolBar.sizeToFit()
    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                      target: nil,
                                      action: nil)
    let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                       target: self,
                                       action: #selector(cancelDateAction))
    toolBar.setItems([spaceButton, cancelButton], animated: true)
    datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
    datePicker.frame.size = CGSize(width: 0, height: 300)
    datePicker.preferredDatePickerStyle = .wheels
    dateTextField.inputAccessoryView = toolBar
    dateTextField.inputView = datePicker
  }
  
  @objc func cancelPersonAction() {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
  @objc func instagramAction() {
    let alert = UIAlertController(title: "Connect with instagram",
                                  message: "Enter your instagram account, please.",
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
      let text = alert.textFields?.first?.text
      self.instagramTextField.text = text
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    alert.addTextField { textField in
      textField.text = "@"
    }
    alert.addAction(okAction)
    alert.addAction(cancelAction)
    present(alert, animated: true)
  }
  
  // MARK: - Facilitating Methods.
  private func formatDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter.string(from: date)
  }
  
  private func setupIndexesForPickers() {
    agePicker.tag = 1
    genderPicker.tag = 2
  }
  
  private func setUpDelegateAndDataSourceForPickers() {
    agePicker.delegate = self
    agePicker.dataSource = self
    genderPicker.delegate = self
    genderPicker.dataSource = self
  }
}
