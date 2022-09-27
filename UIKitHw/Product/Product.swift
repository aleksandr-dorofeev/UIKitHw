//
//  Product.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 26.09.2022.
//

import Foundation

/// Model of sneaker.
struct Product {
  var name: String
  var image: [String]
  var size: [Double]
  var cost: String
  var colors: [String]
}
// Product.
let sneaker = Product(name: "New Balance 327",
                      image: ["NBGreen", "NBIndigo", "NBRed"],
                      size: [38, 38.5, 39, 39.5, 40, 41, 41.5, 43],
                      cost: "6780",
                      colors: ["Green", "Indigo", "Red"])
