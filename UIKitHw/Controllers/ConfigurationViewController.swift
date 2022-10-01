//
//  ConfigurationViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// Screen with configuration text.
final class ConfigurationViewController: UIViewController {
  
  // MARK: - Enums.
  
  /// Constants.
  /// - numberOfLines
  /// - fontSize
  /// - fontColor
  /// - space
  /// - textInstruction
  enum Constants {
    static let numberOfLines = "Количество строк"
    static let fontSize = "Размер шрифта:"
    static let fontColor = "Цвет шрифта"
    static let space = " "
    static let textInstruction = "Нажмите на плюс в верхнем левом углу, чтобы установить новый текст."
  }
  
  /// DefaultValues: Хранит значения для слайдера и пикеров.
  /// - fontSize: Дефолтное значение размера.
  /// - minFontSize: Минимальное значение размера.
  /// - maxFontSize: Максимальное значение размера.
  /// - colors: Массив цветов.
  /// - nameOfColors: массив названий цветов.
  /// - numbersOfLine: Массив значений для количества линий.
  enum DefaultValues {
    static var fontSize: CGFloat = 18
    static let minFontSize: Float = 10
    static let maxFontSize: Float = 70
    static let colors: [UIColor] = [.black, .green, .blue, .red, .yellow, .brown]
    static let nameOfColors = ["Черный", "Зеленый", "Синий", "Красный", "Желтый", "Коричневый"]
    static let numbersOfLine = [1, 2, 3, 4, 5]
  }
  
  // MARK: - Lazy properties.
  lazy var textLabel = UILabel()
  lazy var sizeFontLabel = UILabel()
  lazy var colorLabel = UILabel()
  lazy var numberOfLineLabel = UILabel()
  lazy var sizeFontSlider = UISlider()
  lazy var colorPicker = UIPickerView()
  lazy var numberOfLinePicker = UIPickerView()
  
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
    textLabel.text = Constants.textInstruction
    textLabel.textAlignment = .center
    textLabel.layer.borderWidth = 0.5
    textLabel.font.withSize(DefaultValues.fontSize)
    textLabel.textColor = DefaultValues.colors[colorPicker.selectedRow(inComponent: 0)]
    textLabel.numberOfLines = 1
    textLabel.lineBreakMode = .byWordWrapping
    textLabel.adjustsFontSizeToFitWidth = true
    view.addSubview(textLabel)
  }
  
  private func createSizeFontLabel() {
    sizeFontLabel.frame = CGRect(x: 0, y: 280, width: 300, height: 30)
    sizeFontLabel.center.x = view.center.x
    sizeFontLabel.font.withSize(20)
    sizeFontLabel.addBottomBorder()
    sizeFontLabel.textColor = .black
    sizeFontLabel.textAlignment = .center
    let fontSizeValue = (String(format: "%.1f", DefaultValues.fontSize))
    sizeFontLabel.text = Constants.fontSize + Constants.space + fontSizeValue
    view.addSubview(sizeFontLabel)
  }
  
  private func createSizeFontSlider() {
    sizeFontSlider.frame = CGRect(x: 0, y: 330, width: 350, height: 50)
    sizeFontSlider.center.x = view.center.x
    sizeFontSlider.minimumValue = DefaultValues.minFontSize
    sizeFontSlider.maximumValue = DefaultValues.maxFontSize
    sizeFontSlider.value = Float(DefaultValues.fontSize)
    sizeFontSlider.addTarget(self, action: #selector(changeFontSizeAction), for: .valueChanged)
    view.addSubview(sizeFontSlider)
  }
  
  private func createColorLabel() {
    colorLabel.frame = CGRect(x: 0, y: 400, width: 300, height: 30)
    colorLabel.center.x = view.center.x
    colorLabel.font.withSize(20)
    colorLabel.textColor = .black
    colorLabel.text = Constants.fontColor
    colorLabel.addBottomBorder()
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
    numberOfLineLabel.text = Constants.numberOfLines
    numberOfLineLabel.addBottomBorder()
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
    DefaultValues.fontSize = CGFloat(sender.value)
    textLabel.font = .systemFont(ofSize: DefaultValues.fontSize)
    textLabel.numberOfLines = DefaultValues.numbersOfLine[numberOfLinePicker.selectedRow(inComponent: 0)]
    let fontSizeValue = (String(format: "%.1f", DefaultValues.fontSize))
    sizeFontLabel.text = Constants.fontSize + Constants.space + fontSizeValue
  }
}
