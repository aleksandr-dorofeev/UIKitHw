//
//  Songs.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 25.09.2022.
//

import Foundation

/// List of songs.
class Songs {
  // Как можно обойтись без методов типа? 
  static var firstSong = Song(imageName: "smokeMachine",
                              songName: "Smoke Machine",
                              timeOfSong: "3:43",
                              singer: "Gents",
                              album: "Human Connection")
  static var secondSong = Song(imageName: "afterDark",
                               songName: "After Dark",
                               timeOfSong: "4:17",
                               singer: "Mr. Kitty",
                               album: "Time")
}
