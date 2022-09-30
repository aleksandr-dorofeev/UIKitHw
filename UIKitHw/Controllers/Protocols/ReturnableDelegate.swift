//
//  ReturnableDelegate.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 29.09.2022.
//

import Foundation

/// Protocol for come back to root vc.
protocol ReturnableDelegate: AnyObject {
  func goToRoot()
}
