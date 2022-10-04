//
//  BookViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 04.10.2022.
//

import UIKit

/// Screen with book configuration.
final class BookViewController: UIViewController {
  
  // MARK: Enums.
  enum Constants {
    static let gothicNeoFont = "GothicNeo"
    static let appleSDGothicNeoRegularFont = "AppleSDGothicNeo-Regular"
    static let appleSDGothicNeoBoldFont = "AppleSDGothicNeo-Bold"
    static let arialHebrewFont = "ArialHebrew"
    static let arialHebrewBoldFont = "ArialHebrew-Bold"
    static let courierFont = "Courier"
    static let courierBoldFont = "Courier-Bold"
    static let typewriterFont = "Typewriter"
    static let americanTypewriterFont = "AmericanTypewriter"
    static let americanTypewriterBoldFont = "AmericanTypewriter-Bold"
    static let helveticaNeueFont = "HelveticaNeue"
    static let helveticaNeueBoldFont = "HelveticaNeueBold"
    static let didotFont = "Didot"
    static let didotBoldFont = "Didot-Bold"
    static let defaultSizeFont: CGFloat = 20
    static let defaultIndex = 0
    static let imageForButton = "wrench.and.screwdriver.fill"
    static let titleForButtons = "T"
    static let styleText = ["a", "A"]

  }
  
  enum Fonts {
    static let fonts = [Constants.arialHebrewFont: [UIFont(name: Constants.arialHebrewFont,
                                                           size: Constants.defaultSizeFont),
                                                    UIFont(name: Constants.arialHebrewBoldFont,
                                                           size: Constants.defaultSizeFont)],
                        Constants.gothicNeoFont: [UIFont(name: Constants.appleSDGothicNeoRegularFont,
                                                         size: Constants.defaultSizeFont),
                                                  UIFont(name: Constants.appleSDGothicNeoBoldFont,
                                                         size: Constants.defaultSizeFont)],
                        Constants.courierFont: [UIFont(name: Constants.courierFont,
                                                       size: Constants.defaultSizeFont),
                                                UIFont(name: Constants.courierBoldFont,
                                                       size: Constants.defaultSizeFont)],
                        Constants.typewriterFont: [UIFont(name: Constants.americanTypewriterFont,
                                                          size: Constants.defaultSizeFont),
                                                   UIFont(name: Constants.americanTypewriterBoldFont,
                                                          size: Constants.defaultSizeFont)],
                        Constants.helveticaNeueFont: [UIFont(name: Constants.helveticaNeueFont,
                                                             size: Constants.defaultSizeFont),
                                                      UIFont(name: Constants.helveticaNeueBoldFont,
                                                             size: Constants.defaultSizeFont)],
                        Constants.didotFont: [UIFont(name: Constants.didotFont,
                                                             size: Constants.defaultSizeFont),
                                                      UIFont(name: Constants.didotBoldFont,
                                                             size: Constants.defaultSizeFont)]]
  }
  
  // MARK: - Public properties.
  var currentFont = Constants.arialHebrewFont
  var selectedSegment = Constants.defaultIndex
  var bookText = Book()
  
  // MARK: - Private properties.
  private let bookTextView = UITextView()
  private let settingsButton = UIButton()
  private let settingsView = UIView()
  private let fontSizeSlider = UISlider()
  private let fontPickerView = UIPickerView()
  private let nightModeSwitch = UISwitch()
  private let blackButton = UIButton()
  private let blueButton = UIButton()
  private let redButton = UIButton()
  private let greenButton = UIButton()
  private var fontStyleSegmentControl = UISegmentedControl()
  
  // MARK: - Life circle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubview()
  }
  
  // MARK: - Public actions.
  func changeFontAndSizeAction(name: String, isBold: Bool) {
    guard
      let firstFont = Fonts.fonts[name]?.first,
      let secondFont = Fonts.fonts[name]?.last
    else {
      return
    }
    if isBold {
      bookTextView.font = secondFont
    } else {
      bookTextView.font = firstFont
    }
    
    if selectedSegment == 1 {
      bookTextView.font = secondFont
    }
    bookTextView.font = bookTextView.font?.withSize(CGFloat(fontSizeSlider.value))
  }
  
  // MARK: - Private visual components.
  private func setupSubview() {
    createTextView()
    createSettingsButton()
    createSettingsView()
    createFontSizeSlider()
    createFontStyleSegmentControl()
    createPickerFont()
    createNightModeSwitch()
    createColorsButtons()
  }
  
  private func createTextView() {
    bookTextView.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: view.bounds.height - 70)
    bookTextView.text = bookText.text
    bookTextView.contentInset = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 10)
    bookTextView.isEditable = false
    bookTextView.textAlignment = .justified
    guard let font = Fonts.fonts[Constants.arialHebrewFont]?.first else { return }
    bookTextView.font = font
    view.addSubview(bookTextView)
  }
  
  private func createSettingsButton() {
    settingsButton.frame = CGRect(x: 340, y: 50, width: 50, height: 30)
    settingsButton.backgroundColor = UIColor(cgColor: CGColor(red: 0.5, green: 0.3, blue: 0.4, alpha: 0.6))
    settingsButton.tintColor = .white
    settingsButton.layer.cornerRadius = 10
    settingsButton.setImage(UIImage(systemName: Constants.imageForButton), for: .normal)
    view.addSubview(settingsButton)
    settingsButton.addTarget(self, action: #selector(openSettingsViewAction), for: .touchUpInside)
  }
  
  private func createSettingsView() {
    settingsView.frame = CGRect(x: 0, y: 700, width: view.bounds.width, height: 150)
    settingsView.backgroundColor = .white
    settingsView.alpha = 0.9
    settingsView.isHidden = true
    view.addSubview(settingsView)
  }
  
  private func createFontSizeSlider() {
    fontSizeSlider.frame = CGRect(x: 155, y: 40, width: 230, height: 30)
    fontSizeSlider.minimumValue = 12
    fontSizeSlider.maximumValue = 50
    fontSizeSlider.value = 12
    bookTextView.font = bookTextView.font?.withSize(CGFloat(fontSizeSlider.value))
    fontSizeSlider.addTarget(self, action: #selector(changeFontSizeAction), for: .valueChanged)
    settingsView.addSubview(fontSizeSlider)
  }
  
  private func createFontStyleSegmentControl() {
    fontStyleSegmentControl = UISegmentedControl(items: Constants.styleText)
    fontStyleSegmentControl.frame = CGRect(x: 330, y: 5, width: 55, height: 30)
    fontStyleSegmentControl.selectedSegmentIndex = 0
    fontStyleSegmentControl.addTarget(self, action: #selector(changeFontStyleAction), for: .valueChanged)
    settingsView.addSubview(fontStyleSegmentControl)
  }
  
  private func createPickerFont() {
    fontPickerView.frame = CGRect(x: 5, y: 0, width: 150, height: 125)
    fontPickerView.delegate = self
    fontPickerView.dataSource = self
    settingsView.addSubview(fontPickerView)
  }
  
  private func createNightModeSwitch() {
    nightModeSwitch.frame = CGRect(x: 335, y: 75, width: 50, height: 30)
    nightModeSwitch.isOn = false
    nightModeSwitch.addTarget(self, action: #selector(nightModeAction), for: .valueChanged)
    settingsView.addSubview(nightModeSwitch)
  }
  
  private func createColorsButtons() {
    let buttons = [blackButton, blueButton, redButton, greenButton]
    var startFrameX = 170
    blackButton.backgroundColor = .black
    blueButton.backgroundColor = .blue
    redButton.backgroundColor = .red
    greenButton.backgroundColor = .green
    for colorButton in buttons {
      colorButton.frame = CGRect(x: startFrameX, y: 75, width: 40, height: 40)
      startFrameX += 40
      colorButton.setTitle(Constants.titleForButtons, for: .normal)
      colorButton.layer.cornerRadius = 10
      colorButton.addTarget(self, action: #selector(changeColorTextAction), for: .touchUpInside)
      settingsView.addSubview(colorButton)
    }
  }
  
  // MARK: - Private actions.
  @objc private func openSettingsViewAction() {
    if settingsView.isHidden {
      settingsView.isHidden = false
      settingsButton.frame = CGRect(x: 336, y: 45, width: 50, height: 100)
    } else {
      settingsView.isHidden = true
      settingsButton.frame = CGRect(x: 336, y: 45, width: 50, height: 30)
    }
  }
  
  @objc private func nightModeAction() {
    guard nightModeSwitch.isOn else {
      bookTextView.backgroundColor = .white
      view.backgroundColor = .white
      settingsView.backgroundColor = view.backgroundColor
      return
    }
    bookTextView.backgroundColor = .black
    view.backgroundColor = .black
    settingsView.backgroundColor = view.backgroundColor
  }
  
  @objc private func changeFontSizeAction() {
    bookTextView.font = bookTextView.font?.withSize(CGFloat(fontSizeSlider.value))
  }
  
  @objc private func changeFontStyleAction() {
    selectedSegment = fontStyleSegmentControl.selectedSegmentIndex
    if fontStyleSegmentControl.selectedSegmentIndex == 0 {
      changeFontAndSizeAction(name: currentFont, isBold: false)
    } else {
      changeFontAndSizeAction(name: currentFont, isBold: true)
    }
  }
  
  @objc private func changeColorTextAction(_ button: UIButton) {
    bookTextView.textColor = button.backgroundColor
  }
}
