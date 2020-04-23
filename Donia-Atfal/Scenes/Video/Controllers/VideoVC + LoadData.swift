//
//  VideoVC + LoadData.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit
import AVKit
extension VideoVC {
    
    //MARK: - Call video
    func loadVideo() {
        videoView.landscapeNameLabel?.text = selectedVideo?.name
        //MARK: - Video Player
        videoView.ActivityIndicator?.startAnimating()
        cView.alpha = 0
        player = AVPlayer(url: self.url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        vView.layer.addSublayer(playerLayer)
        
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
         vView.addGestureRecognizer(panGesture)
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
        playerLayer.frame = vView.bounds
    }
    
    //MARK: - ViewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view Did Disappear")
    }
   
    //MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        hideControls(5)
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
    @IBAction func Start_Pause(_ sender: UIButton) {
        if is_playing == true {
            self.cView.alpha = 1
            is_playing = !is_playing
            sender.setBackgroundImage(#imageLiteral(resourceName: "play_white"), for: .normal)
            player.pause()
        } else {
            is_playing = !is_playing // false
            sender.setBackgroundImage(#imageLiteral(resourceName: "pause_white"), for: .normal)
            player.play()
        }
           // is_playing ? showControls() : hideControls()
    }
    
    //MARK: - Show Controls Button
    @IBAction func Show_Controls() {
        showControls(0.5)
        hideControls(4)
    }
    
    //MARK: - Hide Controls Button
    @IBAction func Hide_Controls(_ sender: Any) {
        hideControls(1)
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
            //self.videoView.Start_Pause?.alpha = 1
            self.videoView.FullLabel?.alpha = 1
            self.videoView.CurrentLabel?.alpha = 1
            //self.videoView.BackWardButton?.alpha = 1
            //self.videoView.ForwardButton?.alpha = 1
            videoView.BottomView?.alpha = 1
            is_portrait = true
            vView.removeGestureRecognizer(panGesture)
        } else {
            cView.alpha = 0
            videoView.BottomView?.backgroundColor = .clear
            videoView.BottomView?.alpha = 0
            is_portrait = false
            vView.addGestureRecognizer(panGesture)
        }
    }
    private func Theme_Setup() {
        videoView.BottomView?.backgroundColor = Theme.current.BG_Color
    }
    func hideControls(_ time: TimeInterval) {
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { (timer) in
            UIView.animate(withDuration: 0.3, animations: {
            }) { [weak self] (_) in
                self?.cView.alpha = 0.0
            }
        }
    }
    func showControls(_ time: TimeInterval) {
        Timer.scheduledTimer(withTimeInterval: time, repeats: false) { (timer) in
            UIView.animate(withDuration: 0.3, animations: {
            }) { [weak self] (_) in
                self?.cView.alpha = 1
            }
        }
    }
    
}
