//
//  BirthdayListViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 23.09.2022.
//

import UIKit

/// Screen with person list.
class BirthdayListViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var avatarImage = UIImageView()
  lazy var nameLabel = UILabel()
  lazy var descriptionBirthdayLabel = UILabel()
  lazy var timeBeforeBirthdayLabel = UILabel()
  lazy var boundaryLineLabel = UILabel()
  lazy var avatarSecondImage = UIImageView()
  lazy var nameSecondLabel = UILabel()
  lazy var descriptionBirthdaySecondLabel = UILabel()
  lazy var timeBeforeBirthdaySecondLabel = UILabel()
  lazy var boundaryLineSecondLabel = UILabel()
  lazy var avatarThirdImage = UIImageView()
  lazy var nameThirdLabel = UILabel()
  lazy var descriptionBirthdayThirdLabel = UILabel()
  lazy var timeBeforeBirthdayThirdLabel = UILabel()
  lazy var boundaryLineThirdLabel = UILabel()
  lazy var avatarFourthImage = UIImageView()
  lazy var nameFourthLabel = UILabel()
  lazy var descriptionBirthdayFourthLabel = UILabel()
  lazy var timeBeforeBirthdayFourthLabel = UILabel()
  lazy var boundaryLineFourthLabel = UILabel()

  // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
      setUpViews()
    }
  
  // MARK: - Setup Subviews.
  private func setUpViews() {
    createAvatarImage()
    createNameLabel()
    createDescriptionBirthdayLabel()
    createTimeBeforeBirthday()
    createBoundaryLine()
    createSecondAvatarImage()
    createSecondNameLabel()
    createSecondDescriptionBirthdayLabel()
    createSecondTimeBeforeBirthday()
    createSecondBoundaryLine()
    createThirdAvatarImage()
    createThirdNameLabel()
    createThirdDescriptionBirthdayLabel()
    createThirdTimeBeforeBirthday()
    createThirdBoundaryLine()
    createFourthAvatarImage()
    createFourthNameLabel()
    createFourthDescriptionBirthdayLabel()
    createFourthTimeBeforeBirthday()
    createFourthBoundaryLine()
    createBarButtonItem()
  }
  
  // MARK: - Create Subviews.
  private func createAvatarImage() {
    let image = UIImage(systemName: "person.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    avatarImage.image = image
    avatarImage.frame = CGRect(x: 20, y: 120, width: 60, height: 60)
    avatarImage.backgroundColor = .gray
    avatarImage.layer.borderWidth = 1.0
    avatarImage.layer.masksToBounds = true
    avatarImage.layer.borderColor = UIColor.white.cgColor
    avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
    avatarImage.clipsToBounds = true
    view.addSubview(avatarImage)
  }
  
  private func createNameLabel() {
    nameLabel.frame = CGRect(x: 85, y: 120, width: 50, height: 30)
    nameLabel.textAlignment = .left
    nameLabel.text = "Alexey"
    nameLabel.textColor = .black
    nameLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    nameLabel.font = UIFont.boldSystemFont(ofSize: nameLabel.font.pointSize)
    view.addSubview(nameLabel)
    
  }
  
  private func createDescriptionBirthdayLabel() {
    descriptionBirthdayLabel.frame = CGRect(x: 85, y: 150, width: 230, height: 30)
    descriptionBirthdayLabel.textAlignment = .left
    descriptionBirthdayLabel.text = "10 марта, в среду исполнится 25 лет"
    descriptionBirthdayLabel.textColor = .gray
    descriptionBirthdayLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    view.addSubview(descriptionBirthdayLabel)
  }
  
  private func createTimeBeforeBirthday() {
    timeBeforeBirthdayLabel.frame = CGRect(x: 310, y: 120, width: 60, height: 40)
    timeBeforeBirthdayLabel.textAlignment = .left
    timeBeforeBirthdayLabel.text = "18 дней"
    timeBeforeBirthdayLabel.textColor = .gray
    timeBeforeBirthdayLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    timeBeforeBirthdayLabel.font = UIFont.boldSystemFont(ofSize: timeBeforeBirthdayLabel.font.pointSize)
    view.addSubview(timeBeforeBirthdayLabel)
  }
  
  private func createBoundaryLine() {
    boundaryLineLabel.frame = CGRect(x: 50, y: 170, width: 345, height: 40)
    boundaryLineLabel.text = "_______________________________________"
    boundaryLineLabel.textColor = .lightGray
    view.addSubview(boundaryLineLabel)
  }
  
  private func createSecondAvatarImage() {
    let image = UIImage(systemName: "person.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    avatarSecondImage.image = image
    avatarSecondImage.frame = CGRect(x: 20, y: 210, width: 60, height: 60)
    avatarSecondImage.backgroundColor = .gray
    avatarSecondImage.layer.borderWidth = 1.0
    avatarSecondImage.layer.masksToBounds = true
    avatarSecondImage.layer.borderColor = UIColor.white.cgColor
    avatarSecondImage.layer.cornerRadius = avatarSecondImage.frame.size.width / 2
    avatarSecondImage.clipsToBounds = true
    view.addSubview(avatarSecondImage)
  }
  
  private func createSecondNameLabel() {
    nameSecondLabel.frame = CGRect(x: 85, y: 210, width: 60, height: 30)
    nameSecondLabel.textAlignment = .left
    nameSecondLabel.text = "Vladimir"
    nameSecondLabel.textColor = .black
    nameSecondLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    nameSecondLabel.font = UIFont.boldSystemFont(ofSize: nameSecondLabel.font.pointSize)
    view.addSubview(nameSecondLabel)
  }
  
  private func createSecondDescriptionBirthdayLabel() {
    descriptionBirthdaySecondLabel.frame = CGRect(x: 85, y: 240, width: 230, height: 30)
    descriptionBirthdaySecondLabel.textAlignment = .left
    descriptionBirthdaySecondLabel.text = "30 марта, в четверг исполнится 20 лет"
    descriptionBirthdaySecondLabel.textColor = .gray
    descriptionBirthdaySecondLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    view.addSubview(descriptionBirthdaySecondLabel)
  }
  
  private func createSecondTimeBeforeBirthday() {
    timeBeforeBirthdaySecondLabel.frame = CGRect(x: 310, y: 210, width: 60, height: 40)
    timeBeforeBirthdaySecondLabel.textAlignment = .left
    timeBeforeBirthdaySecondLabel.text = "28 дней"
    timeBeforeBirthdaySecondLabel.textColor = .gray
    timeBeforeBirthdaySecondLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    timeBeforeBirthdaySecondLabel.font = UIFont.boldSystemFont(ofSize: timeBeforeBirthdaySecondLabel.font.pointSize)
    view.addSubview(timeBeforeBirthdaySecondLabel)
  }
  
  private func createSecondBoundaryLine() {
    boundaryLineSecondLabel.frame = CGRect(x: 50, y: 260, width: 345, height: 40)
    boundaryLineSecondLabel.text = "_______________________________________"
    boundaryLineSecondLabel.textColor = .lightGray
    view.addSubview(boundaryLineSecondLabel)
  }
  
  private func createThirdAvatarImage() {
    let image = UIImage(systemName: "person.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    avatarThirdImage.image = image
    avatarThirdImage.frame = CGRect(x: 20, y: 300, width: 60, height: 60)
    avatarThirdImage.backgroundColor = .gray
    avatarThirdImage.layer.borderWidth = 1.0
    avatarThirdImage.layer.masksToBounds = true
    avatarThirdImage.layer.borderColor = UIColor.white.cgColor
    avatarThirdImage.layer.cornerRadius = avatarThirdImage.frame.size.width / 2
    avatarThirdImage.clipsToBounds = true
    view.addSubview(avatarThirdImage)
  }
  
  private func createThirdNameLabel() {
    nameThirdLabel.frame = CGRect(x: 85, y: 300, width: 60, height: 30)
    nameThirdLabel.textAlignment = .left
    nameThirdLabel.text = "Tamara"
    nameThirdLabel.textColor = .black
    nameThirdLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    nameThirdLabel.font = UIFont.boldSystemFont(ofSize: nameThirdLabel.font.pointSize)
    view.addSubview(nameThirdLabel)
  }
  
  private func createThirdDescriptionBirthdayLabel() {
    descriptionBirthdayThirdLabel.frame = CGRect(x: 85, y: 330, width: 230, height: 30)
    descriptionBirthdayThirdLabel.textAlignment = .left
    descriptionBirthdayThirdLabel.text = "16 июня, в субботу исполнится 24 лет"
    descriptionBirthdayThirdLabel.textColor = .gray
    descriptionBirthdayThirdLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    view.addSubview(descriptionBirthdayThirdLabel)
  }
  
  private func createThirdTimeBeforeBirthday() {
    timeBeforeBirthdayThirdLabel.frame = CGRect(x: 310, y: 300, width: 60, height: 40)
    timeBeforeBirthdayThirdLabel.textAlignment = .left
    timeBeforeBirthdayThirdLabel.text = "53 дней"
    timeBeforeBirthdayThirdLabel.textColor = .gray
    timeBeforeBirthdayThirdLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    timeBeforeBirthdayThirdLabel.font = UIFont.boldSystemFont(ofSize: timeBeforeBirthdayThirdLabel.font.pointSize)
    view.addSubview(timeBeforeBirthdayThirdLabel)
  }
  
  private func createThirdBoundaryLine() {
    boundaryLineThirdLabel.frame = CGRect(x: 50, y: 350, width: 345, height: 40)
    boundaryLineThirdLabel.text = "_______________________________________"
    boundaryLineThirdLabel.textColor = .lightGray
    view.addSubview(boundaryLineThirdLabel)
  }
  
  private func createFourthAvatarImage() {
    let image = UIImage(systemName: "person.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    avatarFourthImage.image = image
    avatarFourthImage.frame = CGRect(x: 20, y: 390, width: 60, height: 60)
    avatarFourthImage.backgroundColor = .gray
    avatarFourthImage.layer.borderWidth = 1.0
    avatarFourthImage.layer.masksToBounds = true
    avatarFourthImage.layer.borderColor = UIColor.white.cgColor
    avatarFourthImage.layer.cornerRadius = avatarFourthImage.frame.size.width / 2
    avatarFourthImage.clipsToBounds = true
    view.addSubview(avatarFourthImage)
  }
  
  private func createFourthNameLabel() {
    nameFourthLabel.frame = CGRect(x: 85, y: 390, width: 60, height: 30)
    nameFourthLabel.textAlignment = .left
    nameFourthLabel.text = "Name"
    nameFourthLabel.textColor = .black
    nameFourthLabel.font = UIFont(name: "Arial Hebrew", size: 15)
    nameFourthLabel.font = UIFont.boldSystemFont(ofSize: nameFourthLabel.font.pointSize)
    view.addSubview(nameFourthLabel)
  }
  
  private func createFourthDescriptionBirthdayLabel() {
    descriptionBirthdayFourthLabel.frame = CGRect(x: 85, y: 420, width: 230, height: 30)
    descriptionBirthdayFourthLabel.textAlignment = .left
    descriptionBirthdayFourthLabel.text = "date, в day исполнится age лет"
    descriptionBirthdayFourthLabel.textColor = .gray
    descriptionBirthdayFourthLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    view.addSubview(descriptionBirthdayFourthLabel)
  }
  
  private func createFourthTimeBeforeBirthday() {
    timeBeforeBirthdayFourthLabel.frame = CGRect(x: 310, y: 390, width: 60, height: 40)
    timeBeforeBirthdayFourthLabel.textAlignment = .left
    timeBeforeBirthdayFourthLabel.text = "day.coount дней"
    timeBeforeBirthdayFourthLabel.textColor = .gray
    timeBeforeBirthdayFourthLabel.font = UIFont(name: "Arial Hebrew", size: 13)
    timeBeforeBirthdayFourthLabel.font = UIFont.boldSystemFont(ofSize: timeBeforeBirthdayFourthLabel.font.pointSize)
    view.addSubview(timeBeforeBirthdayFourthLabel)
  }
  
  private func createFourthBoundaryLine() {
    boundaryLineFourthLabel.frame = CGRect(x: 50, y: 440, width: 345, height: 40)
    boundaryLineFourthLabel.text = "_______________________________________"
    boundaryLineFourthLabel.textColor = .lightGray
    view.addSubview(boundaryLineFourthLabel)
  }
  
  private func createBarButtonItem() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                  target: self,
                                                                  action: #selector(presentPersonAction))
  }
  
  // MARK: - Actions.
  @objc func presentPersonAction() {
    let personViewController = PersonViewController()
    personViewController.modalPresentationStyle = .formSheet
     self.present(personViewController, animated: true, completion: nil)
  }
}
