//
//  Player.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 25.09.2022.
//
import AVFoundation
import Foundation

/// Global current song and logic update.
// Самому не нравится наличие глобальной переменной и метода, не знаю как в этой ситуации сделать по другому.
var currentSong = Songs.firstSong

func updateCurrentSong(song: Song) {
  currentSong = song
}
