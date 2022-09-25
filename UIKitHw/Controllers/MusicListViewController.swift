//
//  ViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 22.09.2022.
//
import AVFoundation
import UIKit

/// List music screen.
class MusicListViewController: UIViewController {

  // MARK: - Outlets.
  @IBOutlet weak var firstCoverImageView: UIImageView!
  @IBOutlet weak var secondCoverImageView: UIImageView!
  @IBOutlet weak var firstNameSongButton: UIButton!
  @IBOutlet weak var secondNameSongButton: UIButton!
  @IBOutlet weak var firstTimeSongLabel: UILabel!
  @IBOutlet weak var secondTimeSongLabel: UILabel!
    
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViews()
  }
  
  // MARK: - Setup Views.
  private func setUpViews() {
    setImagesForSongs()
    setTimeForSongs()
    setNameForSongs()
  }
  
  // MARK: - Actions.
  @IBAction func firstSongAction(_ sender: UIButton) {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    guard let playerVc = storyBoard.instantiateViewController(
      identifier: "PlayerViewController") as? PlayerViewController else { return }
    updateCurrentSong(song: Songs.firstSong)
    do {
      try playerVc.player = AVAudioPlayer(contentsOf: (currentSong.songURL()))
    } catch {
      errorAlert(title: "Oops", message: "Song not found", style: .actionSheet)
    }
    playerVc.player?.play()
    playerVc.modalPresentationStyle = .formSheet
    present(playerVc, animated: true)
  }
  
  @IBAction func secondSongAction(_ sender: UIButton) {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    guard let playerVc = storyBoard.instantiateViewController(
      identifier: "PlayerViewController") as? PlayerViewController else { return }
    updateCurrentSong(song: Songs.secondSong)
    do {
      try playerVc.player = AVAudioPlayer(contentsOf: (currentSong.songURL()))
    } catch {
      errorAlert(title: "Oops", message: "Song not found", style: .actionSheet)
    }
    playerVc.player?.play()
    playerVc.modalPresentationStyle = .formSheet
    present(playerVc, animated: true)
  }
  
  // MARK: - Configure views.
  private func setImagesForSongs() {
    firstCoverImageView.image = Songs.firstSong.imageUrl()
    secondCoverImageView.image = Songs.secondSong.imageUrl()
  }
  
  private func setTimeForSongs() {
    firstTimeSongLabel.text = Songs.firstSong.timeOfSong
    secondTimeSongLabel.text = Songs.secondSong.timeOfSong
  }
  
  private func setNameForSongs() {
    firstNameSongButton.setTitle(Songs.firstSong.songName, for: .normal)
    secondNameSongButton.setTitle(Songs.secondSong.songName, for: .normal)
  }
  
  // MARK: - Error alert.
  private func errorAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let action = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(action)
    present(alert, animated: true)
  }
}
