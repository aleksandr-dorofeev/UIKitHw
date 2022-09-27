//
//  SceneDelegate.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//

import UIKit

/// SceneDelegate.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.windowScene = windowScene
    let entryVc = EntryViewController()
    let navigationController = UINavigationController(rootViewController: entryVc)
    navigationController.navigationBar.tintColor = .black
    if let window = window {
      window.rootViewController = navigationController
      window.backgroundColor = .white
      window.makeKeyAndVisible()
    }
  }
}
