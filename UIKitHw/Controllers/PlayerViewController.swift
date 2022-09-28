//
//  PlayerViewController.swift
//  UIKitHw
//
//  Created by Aleksandr Dorofeev on 25.09.2022.
//

import AVFoundation
import UIKit

/// Player detail screen.
class PlayerViewController: UIViewController {

  // MARK: - Outlets.
  @IBOutlet weak var coverImageView: UIImageView!
  @IBOutlet weak var nameSongLabel: UILabel!
  @IBOutlet weak var nameAlbumLabel: UILabel!
  @IBOutlet weak var nameSingerLabel: UILabel!
  @IBOutlet weak var playPauseButton: UIButton!
  @IBOutlet weak var timeSlider: UISlider!
  @IBOutlet weak var currentTimeLabel: UILabel!
  @IBOutlet weak var volumeSlider: UISlider!
  
  // MARK: - Variables.
  var player: AVAudioPlayer?
  var timer = Timer()
  var songName = String()
  var singerName = String()
  var albumName = String()
  var coverImage = UIImage()
  
  // MARK: - viewDidLoad.
  override func viewDidLoad() {
    super.viewDidLoad()
    validationPlayback()
    setupViews()
  }
  
  // MARK: - viewWillAppear.
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateInformation()
  }
  
  // MARK: - Setups Views.
  private func setupViews() {
    configureTimerForTimeSlider()
    configureTimeSlider()
  }
  
  // MARK: - Configured.
  private func configureTimeSlider() {
    timeSlider.minimumValue = 0.0
  }
  
  private func configureTimerForTimeSlider() {
    timer = Timer.scheduledTimer(timeInterval: 0.1,
                                 target: self,
                                 selector: #selector(timerAction),
                                 userInfo: nil, repeats: true)
  }
  
  // MARK: - Update info.
  func updateInformation() {
    coverImageView.image = currentSong.imageUrl()
    nameSongLabel.text = currentSong.songName
    nameAlbumLabel.text = currentSong.album
    nameSingerLabel.text = currentSong.singer
  }
  
  // MARK: - Validation playback.
  private func validationPlayback() {
    guard player?.isPlaying == true else {
      return playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal) }
    playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
  }
  
  // MARK: - Actions.
  @IBAction func playPauseAction(_ sender: UIButton) {
    if player?.isPlaying == true {
      player?.pause()
      sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
    } else {
      player?.play()
      sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
  }
  
  @IBAction func playSliderAction(_ sender: UISlider) {
    timeSlider.maximumValue = Float(player?.duration ?? 0)
    if sender == timeSlider {
      player?.currentTime = TimeInterval(sender.value)
    }
  }
  
  @IBAction func nextSongAction(_ sender: UIButton) {
    if currentSong.songName == Songs.firstSong.songName {
      updateCurrentSong(song: Songs.secondSong)
    }
    do {
      try player = AVAudioPlayer(contentsOf: (currentSong.songURL()))
    } catch {
      errorAlert(title: "Oops", message: "Song not found", style: .actionSheet)
    }
    player?.play()
    updateInformation()
  }
  
  @IBAction func previousSongAction(_ sender: UIButton) {
    if currentSong.songName == Songs.secondSong.songName {
      updateCurrentSong(song: Songs.firstSong)
    }
    do {
      try player = AVAudioPlayer(contentsOf: (currentSong.songURL()))
    } catch {
      errorAlert(title: "Oops", message: "Song not found", style: .actionSheet)
    }
    player?.play()
    updateInformation()
  }
  
  @IBAction func volumeAction(_ sender: Any) {
    player?.volume = volumeSlider.value
  }
  
  @IBAction func dismissAction(_ sender: Any) {
    player?.stop()
    dismiss(animated: true)
  }
  
  // MARK: - @objc.
  @objc func timerAction() {
    timeSlider.value = Float(player?.currentTime ?? 0)
    let currentTime = Int(player?.currentTime ?? 0)
    let minutes = currentTime / 60
    let seconds = currentTime - minutes * 60
    currentTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
  }
  
  // MARK: - Error alert(Не знаю как вынести правильно что бы переиспользовать).
  private func errorAlert(title: String, message: String, style: UIAlertController.Style) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: style)
    let alertAction = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(alertAction)
    present(alert, animated: true)
  }
}
