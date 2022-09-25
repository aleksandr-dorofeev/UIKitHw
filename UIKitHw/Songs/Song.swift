//
//  Songs.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 25.09.2022.
//

import UIKit

/// Song model.
struct Song {
  let imageName: String
  let songName: String
  let timeOfSong: String
  let singer: String
  let album: String
  lazy var songPath = Bundle.main.path(forResource: songName, ofType: "mp3")
  
  mutating func songURL() -> URL {
    return URL(filePath: songPath ?? " ")
  }
  
  mutating func imageUrl() -> UIImage? {
    if let image = UIImage(named: imageName) {
      return image
    }
    return nil
  }
}
