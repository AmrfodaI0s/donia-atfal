//
//  VideoVC + Video.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit
import AVFoundation
extension VideoVC {
    
    //MARK: - Video Slider Began Tracking
    @objc func sliderBeganTracking() {
        is_sliding = true
    }
    
    //MARK: - VideoSlider is Moving
    @objc func sliderISMoving() {
        
        player.pause()
        if let sender_value = videoView.videoSlider?.value {
        //Turn Slider Value into Time To Display
        let hours = Int(sender_value/3600)
        let mints = Int(sender_value/60) % 60
        let seconds = Int(sender_value.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            self.videoView.CurrentLabel?.text = "\(hours):\(mints):\(seconds)"
        } else {
            self.videoView.CurrentLabel?.text = "\(mints):\(seconds)"
        }
    }
    }
    
    //MARK: - Video Slider Ended Tracking
    @objc func sliderEndedTracking() {
        
        is_sliding = false
        if let sender_value = videoView.videoSlider?.value {
        player.seek(to: CMTimeMake(value: Int64(sender_value * 1000), timescale: 1000))
//        videoSlider.value = videoSlider.value
        player.play()
        videoView.Start_Pause?.setImage(#imageLiteral(resourceName: "pause_white"), for: .normal)
        }
    }
    
    //MARK: - Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "duration" , let duration = player.currentItem?.duration.seconds , duration > 0.0 {
            videoView.ActivityIndicator?.stopAnimating()
            videoView.ActivityIndicator?.alpha = 0.0
            self.videoView.FullLabel?.text = getTimeString(time: player.currentItem!.duration)
            videoView.ControlsView?.alpha = 1
        }
    }
    
    //MARK: - Add Time To Current Time Label
    func addTimeObserver() {
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let mainQueue = DispatchQueue.main
        _ = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { [weak self] (time) in
            guard let currentItem = self?.player.currentItem else { return }
            guard currentItem.status.rawValue == AVPlayerItem.Status.readyToPlay.rawValue else { return }
            self?.videoView.videoSlider?.minimumValue = 0
            self?.videoView.videoSlider?.maximumValue = Float(currentItem.duration.seconds)
            if self?.is_sliding == true{
                self?.videoView.videoSlider?.value = (self?.videoView.videoSlider?.value)!
            } else {
                self?.videoView.videoSlider?.value = Float(currentItem.currentTime().seconds)
                /*
                 the auto play next code will be here
                 */
                if self?.videoView.videoSlider?.value == Float(currentItem.duration.seconds) {
                    print("The end")
                }
            }
            self?.videoView.CurrentLabel?.text = self?.getTimeString(time: currentItem.currentTime())
        })
    }
    
    //MARK: - Get Full Time Func
    func getTimeString(time : CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let mints = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return "\(hours):\(mints):\(seconds)"
        } else {
            return "\(mints):\(seconds)"
        }
    }
    
    //MARK: - Forward Video
    @objc func Video_Forward() {
        guard let duration = player.currentItem?.duration else { return }
        let currenttime = CMTimeGetSeconds(player.currentTime())
        let nextTime = currenttime + 5
        if nextTime < (CMTimeGetSeconds(duration) - 5.0) {
            player.seek(to: CMTimeMake(value: Int64(nextTime * 1000), timescale: 1000))
        }
    }
    
    //MARK: - Backward Video
   @objc func Video_Backward() {
        player.pause()
        let currenttime = CMTimeGetSeconds(player.currentTime())
        let nextTime = currenttime - 5
        if nextTime < 0 {
            player.seek(to: CMTimeMake(value: Int64(0 * 1000), timescale: 1000))
        } else {
            player.seek(to: CMTimeMake(value: Int64(nextTime * 1000), timescale: 1000))
        }
        player.play()
    }
}
