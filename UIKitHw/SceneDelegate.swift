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
    
    let configurationVC = ConfigurationViewController()
    let navigationController = UINavigationController(rootViewController: configurationVC)
    
    let tabBarController = UITabBarController()
    tabBarController.setViewControllers([navigationController], animated: true)
    configurationVC.tabBarItem = UITabBarItem(title: "Конфигурация",
                                              image: UIImage(systemName: "slider.vertical.3"),
                                              tag: 0)
    
    guard let window = window else { return }
      window.rootViewController = tabBarController
      window.backgroundColor = .white
      window.makeKeyAndVisible()
  }
}
