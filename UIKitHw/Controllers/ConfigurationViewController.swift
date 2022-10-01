//
//  ConfigurationViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Контроллер.
final class ConfigurationViewController: UIViewController {
  
  // MARK: - Lazy properties.
  lazy var textLabel = UILabel()
  lazy var sizeFontLabel = UILabel()
  lazy var colorLabel = UILabel()
  lazy var numberOfLineLabel = UILabel()
  lazy var sizeFontSlider = UISlider()
  lazy var colorPicker = UIPickerView()
  lazy var numberOfLinePicker = UIPickerView()
  
  // Default values.
  var fontSize: CGFloat = 18
  var minFontSize: Float = 10
  var maxFontSize: Float = 70
  let colors: [UIColor] = [.black, .green, .blue, .red, .yellow, .brown]
  let nameOfColors = ["Черный", "Зеленый", "Синий", "Красный", "Желтый", "Коричневый"]
  let numbersOfLine = [1, 2, 3, 4, 5]
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Setup Subviews.
  private func setupSubviews() {
    createAddNavigationItem()
    createTextLabel()
    createSizeFontLabel()
    createColorLabel()
    createNumberOfLineLabel()
    createSizeFontSlider()
    createColorPicker()
    createNumberOfLinesPicker()
  }
  
  // MARK: - Create elements.
  private func createAddNavigationItem() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                       target: self,
                                                       action: #selector(addTextAction))
  }
  
  private func createTextLabel() {
    textLabel.frame = CGRect(x: 0, y: 100, width: 350, height: 150)
    textLabel.center.x = view.center.x
    textLabel.textAlignment = .center
    textLabel.layer.borderWidth = 0.5
    textLabel.font.withSize(fontSize)
    textLabel.textColor = colors[colorPicker.selectedRow(inComponent: 0)]
    textLabel.numberOfLines = 0
    textLabel.lineBreakMode = .byWordWrapping
    textLabel.adjustsFontSizeToFitWidth = true
    view.addSubview(textLabel)
  }
  
  private func createSizeFontLabel() {
    sizeFontLabel.frame = CGRect(x: 0, y: 300, width: 300, height: 30)
    sizeFontLabel.center.x = view.center.x
    sizeFontLabel.font.withSize(20)
    sizeFontLabel.textColor = .black
    sizeFontLabel.textAlignment = .center
    sizeFontLabel.text = "Размер шрифта \(fontSize)"
    view.addSubview(sizeFontLabel)
  }
  
  private func createSizeFontSlider() {
    sizeFontSlider.frame = CGRect(x: 0, y: 330, width: 350, height: 50)
    sizeFontSlider.center.x = view.center.x
    sizeFontSlider.minimumValue = minFontSize
    sizeFontSlider.maximumValue = maxFontSize
    sizeFontSlider.value = Float(fontSize)
    sizeFontSlider.addTarget(self, action: #selector(changeFontSizeAction), for: .valueChanged)
    view.addSubview(sizeFontSlider)
  }
  
  private func createColorLabel() {
    colorLabel.frame = CGRect(x: 0, y: 400, width: 300, height: 30)
    colorLabel.center.x = view.center.x
    colorLabel.font.withSize(20)
    colorLabel.textColor = .black
    colorLabel.text = "Цвет шрифта"
    colorLabel.textAlignment = .center
    view.addSubview(colorLabel)
  }
  
  private func createColorPicker() {
    colorPicker.frame = CGRect(x: 0, y: 430, width: 350, height: 120)
    colorPicker.center.x = view.center.x
    colorPicker.dataSource = self
    colorPicker.delegate = self
    view.addSubview(colorPicker)
  }
  
  private func createNumberOfLineLabel() {
    numberOfLineLabel.frame = CGRect(x: 0, y: 610, width: 300, height: 30)
    numberOfLineLabel.center.x = view.center.x
    numberOfLineLabel.textColor = .black
    numberOfLineLabel.text = "Количество строк"
    numberOfLineLabel.textAlignment = .center
    view.addSubview(numberOfLineLabel)
  }
  
  private func createNumberOfLinesPicker() {
    numberOfLinePicker.frame = CGRect(x: 0, y: 620, width: 350, height: 120)
    numberOfLinePicker.center.x = view.center.x
    numberOfLinePicker.dataSource = self
    numberOfLinePicker.delegate = self
    view.addSubview(numberOfLinePicker)
  }
  
  // MARK: - Actions.
  @objc private func addTextAction() {
    addTextAlert()
  }
  
  @objc private func changeFontSizeAction(sender: UISlider) {
    guard sender == sizeFontSlider else { return }
    fontSize = CGFloat(sender.value)
    textLabel.font = .systemFont(ofSize: fontSize)
    textLabel.numberOfLines = numbersOfLine[numberOfLinePicker.selectedRow(inComponent: 0)]
    sizeFontLabel.text = "Размер шрифта \(String(format: "%.1f", fontSize))"
  }
}
