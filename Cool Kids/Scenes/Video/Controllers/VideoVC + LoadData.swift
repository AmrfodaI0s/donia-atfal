//
//  VideoVC + LoadData.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit
import AVFoundation
extension VideoVC {
    
    //MARK: - Call video
    func loadVideo() {
        videoView.landscapeNameLabel?.text = selectedVideo?.name
        
        //MARK: - Video Player
        videoView.ActivityIndicator?.startAnimating()
        videoView.ControlsView?.alpha = 0
        player = AVPlayer(url: self.url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        videoView.videoView?.layer.addSublayer(playerLayer)
        
        //MARK: - Adding Video Observer
        player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new , .initial], context: nil)
        
        //Time Function
        addTimeObserver()
        
        //MARK: - videoSlider Targets
        videoView.videoSlider?.addTarget(self, action: #selector(sliderBeganTracking), for: .touchDown)
        videoView.videoSlider?.addTarget(self, action: #selector(sliderEndedTracking), for: .touchUpInside)
        videoView.videoSlider?.addTarget(self, action: #selector(sliderEndedTracking), for: .touchUpOutside)
        videoView.videoSlider?.addTarget(self, action: #selector(sliderISMoving), for: .touchDragInside)
        
        //BottomView Gestures
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(PanGestureFunc))
        videoView.videoView?.addGestureRecognizer(panGesture)
    }
    
    //MARK: - Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        player.play()
    }
    
    //MARK: - ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        playerLayer.frame = videoView.videoView!.bounds
    }
    
    //MARK: - ViewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.dismiss(animated: true) {
            self.removeFromParent()
        }
    }
    
    //MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        //Calling Theme
        Theme_Setup()
        
        //Setup Orientation To Portrait At The Begining
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        //CollectionView Dimensions
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.portraitCollectionWidth = self.videoView.RecommendedCollection.frame.size.width
            self.portraitFrameHeight = self.view.frame.size.height
            self.portraitWidth = self.portraitCollectionWidth
            self.portraitHeight = self.portraitFrameHeight
            self.videoView.RecommendedCollection?.reloadData()
        }
    }
    
    //MARK: - Start-Pause Button
    @IBAction func Start_Pause(_ sender: Any) {
        if is_playing == true {
            is_playing = !is_playing
            videoView.Start_Pause?.setImage(#imageLiteral(resourceName: "play_white"), for: .normal)
            player.pause()
        } else {
            is_playing = !is_playing
            videoView.Start_Pause?.setImage(#imageLiteral(resourceName: "pause_white"), for: .normal)
            player.play()
        }
    }
    
    //MARK: - Show Controls Button
    @IBAction func Show_Controls() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.videoView.ControlsView?.alpha = 1
        }
    }
    
    //MARK: - Hide Controls Button
    @IBAction func Hide_Controls(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
        }) { [weak self] (_) in
            self?.videoView.ControlsView?.alpha = 0.0
        }
    }
    //MARK: - Forward Button
    @IBAction func Backward_Button(_ sender: Any) {
        Video_Backward()
    }
    
    //MARK: - Backward Button
    @IBAction func ForwardButton(_ sender: Any) {
        Video_Forward()
    }
    //MARK: - Back Button
    @IBAction func Back_Button(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Orientation Will Change
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isPortrait == true {
            videoView.BottomView?.backgroundColor = Theme.current.BG_Color
            self.videoView.videoSlider?.alpha = 1
            self.videoView.Start_Pause?.alpha = 1
            self.videoView.FullLabel?.alpha = 1
            self.videoView.CurrentLabel?.alpha = 1
            self.videoView.BackWardButton?.alpha = 1
            self.videoView.ForwardButton?.alpha = 1
            videoView.BottomView?.alpha = 1
            videoView.ControlsView?.removeGestureRecognizer(panGesture)
        } else {
            videoView.ControlsView?.alpha = 0
            videoView.BottomView?.backgroundColor = .clear
            videoView.BottomView?.alpha = 0
            videoView.ControlsView?.addGestureRecognizer(panGesture)
        }
    }
    private func Theme_Setup() {
        videoView.BottomView?.backgroundColor = Theme.current.BG_Color
    }
    
}
