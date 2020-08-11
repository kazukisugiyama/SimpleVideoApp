//
//  VideoPlayerViewController.swift
//  SimpleVideoApp
//
//  Created by 杉山和輝 on 2020/08/07.
//  Copyright © 2020 杉山和輝. All rights reserved.
//

import AVFoundation
import AVKit
import MediaPlayer
import UIKit

// MARK: - class

class VideoPlayerViewController: BaseViewController {
    
    let timeScale = CMTimeScale(NSEC_PER_SEC)
    var asset: AVAsset?
    var currentTime: CMTime?
    var cuurentRate: Float = 0
    var fileName: String = ""
    var filePath: String = ""
    
    @IBOutlet weak var playerView: VideoPlayerView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playAndPauseImageView: UIImageView!
    
    var player = AVPlayer()
    var periodicTimeObserverToken: Any?
    var periodicBoundaryObserverToken: Any?
    var itemDuration: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioSession()
        setupPlayer()
    }
    
    // MARK: - IBAction
    
    @IBAction func actionSliderValueChange(_ sender: UISlider) {
        let seconds = Double(sender.value) * itemDuration
        let time = CMTime(seconds: seconds, preferredTimescale: timeScale)
        changePosition(time: time)
    }
    
    @IBAction func actionSliderTouchUpOutside(_ sender: Any) {
        cuurentRate = player.rate
    }
    
    @IBAction func actionSliderTouchUpInside(_ sender: UISlider) {
        resumePlay()
    }
    
    @IBAction func actionPlayAndPause(_ sender: Any) {
        changePlayAndPause()
    }
    
    @IBAction func actionBack10Secounds(_ sender: Any) {
        changePosition10Secounds(isForward: false)
    }
    
    @IBAction func actionForward10Secounds(_ sender: Any) {
        changePosition10Secounds(isForward: true)
    }
    
    // MARK: - private method
    
    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        } catch {
            print("audioSession.setCategory failed")
        }
        do {
            try audioSession.setActive(true)
            print("audio session set active !!")
        } catch {
            print("audioSession.setActive failed")
        }
    }
    
    private func setupPlayer() {
        playerView.player = player
        // Presenterから取得する
        replacePlayerItem(filePath: filePath, fileExtension: "mp4")
        addPeriodicTimeObserver()
        addBoundaryTimeObserver()
        player.play()
    }
    
    private func addPeriodicTimeObserver() {
        print("addPeriodicTimeObserver before")
        print(player.rate)
        // 再生時間を検知し、シークバーを移動させるためにオブザーバーを追加
        let time = CMTime(seconds: 0.5, preferredTimescale: timeScale)
        periodicTimeObserverToken = player.addPeriodicTimeObserver(forInterval: time,
                                                                   queue: .main)
        { [weak self] time in
            DispatchQueue.main.async {
                print("update timer:\(CMTimeGetSeconds(time))")
                self?.updateSlider()
            }
        }
        print("addPeriodicTimeObserver after")
        print(player.rate)
    }
    
    private func addBoundaryTimeObserver() {
        // 動画が再生完了したかを検知するためにオブザーバーを追加
        guard let time = asset?.duration else { return }
        let duration = NSValue.init(time: time)
        periodicBoundaryObserverToken = player.addBoundaryTimeObserver(forTimes: [duration],
                                                                       queue: nil)
        {
            print("addBoundaryTimeObserver")
            self.changePlayAndPause()
        }
    }
    
    private func replacePlayerItem(filePath: String, fileExtension: String) {
        guard let url = URL(string: filePath) else {
            print("url is nil")
            return
        }
        print("url : \(url)")
        
        asset = AVAsset(url: url)
        guard let duration = asset?.duration else {
            return
        }
        itemDuration = CMTimeGetSeconds(duration)
        
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
    }
    
    private func updateSlider() {
        currentTime = player.currentItem?.currentTime() ?? CMTime.zero
        if itemDuration != 0 {
            slider.value = Float(CMTimeGetSeconds(currentTime ?? CMTime.zero) / itemDuration)
        }
    }
    
    private func changePosition(time: CMTime) {
        //cuurentRate = player.rate
        print("changePosition player.rate")
        print(cuurentRate)
        currentTime = time
        player.rate = 0
        /*
        player.seek(to: currentTime ?? CMTime.zero, completionHandler: {_ in
            self.player.rate = 1
        })
 */
    }
    
    private func resumePlay() {
        player.seek(to: currentTime ?? CMTime.zero, completionHandler: {_ in
            //self.player.play()
            self.player.rate = self.cuurentRate
            print("resumePlay player.rate")
            print(self.cuurentRate)
        })
    }
    
    private func resumePlaySpecifiedTime(time: CMTime) {
        currentTime = time
        player.seek(to: time, completionHandler: {_ in
            //self.player.play()
            self.player.rate = self.cuurentRate
            print("resumePlaySpecifiedTime player.rate")
            print(self.cuurentRate)
        })
    }
    
    private func changePosition10Secounds(isForward: Bool) {
        let currentTime = player.currentTime()
        let fixedTime = CMTime(value: 1000, timescale: 100)
        var time: CMTime
        
        if (isForward) {
            time = currentTime + fixedTime
        } else {
            time = currentTime - fixedTime
        }
        //changePosition(time: time)
        resumePlaySpecifiedTime(time: time)
    }
    
    private func changePlayAndPause() {
        let currentTime = CMTimeGetSeconds(player.currentItem?.currentTime() ??  CMTime.zero)
        // TODO: 秒数の小数点2位以下がずれてくるので切り捨て（一時対応）
        let currentTimeFloor = floor(currentTime*10)/10
        let itemDurationFloor = floor(itemDuration*10)/10
        
        if (player.rate != 0) && (player.error == nil) {
            playAndPauseImageView.image = UIImage(systemName: "play.fill")
            playAndPauseImageView.tintColor = UIColor.white
            player.pause()
        } else {
            if (currentTimeFloor == itemDurationFloor) {
                let time = CMTime.zero
                //changePosition(time: time)
                resumePlaySpecifiedTime(time: time)
                //player.rate = 1.0
            }
            playAndPauseImageView.image = UIImage(systemName: "pause.fill")
            playAndPauseImageView.tintColor = UIColor.white
            player.play()
        }
    }
    
    private func showPurchasedVideo() {
        let storyboard = R.storyboard.purchasedVideoBase()
        showStoryBoard(storyboard)
    }
    
}

extension VideoPlayerViewController: CustomNavigationBarViewDelegate {
    func actionLeftButton() {
        // 前画面へ戻る
        showPurchasedVideo()
    }

    func actionRightButton1() {
        // 処理なし
        return
    }
    
    func actionRightButton2() {
        // 処理なし
        return
    }
}
