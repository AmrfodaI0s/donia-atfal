//
//  VideoVC.swift
//  Cool Kids
//
//  Created by Eslam on 4/12/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
import AVKit
class VideoVC: UIViewController {
    
  
    @IBOutlet weak var startPause: UIButton!
    @IBOutlet weak var infoViewHeightCons: NSLayoutConstraint!
    
    @IBOutlet var videoView: VideoView!
    //Variables & Objects
    let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!
    var lastContentOffset: CGFloat = 0
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    var is_playing = true
    var is_sliding = false
    var is_Down = true
    var currentState : State = .closed
    var animations = [UIViewPropertyAnimator]()
    var progress = CGFloat()
    var panGesture = UIPanGestureRecognizer()
    var portraitCollectionWidth = CGFloat()
    var portraitFrameHeight = CGFloat()
    var portraitHeight = CGFloat()
    var portraitWidth = CGFloat()
    var is_Liked = false
    var selectedVideo: Video?
    var related_videos: Videos?
    let cell_id = "videoCell"
    var is_portrait = true {
        didSet {
            if self.is_portrait == true {
                portraitWidth = portraitCollectionWidth
                if let flowLayout = videoView.RecommendedCollection.collectionViewLayout as? UICollectionViewFlowLayout {
                    flowLayout.scrollDirection = .vertical
                    videoView.RecommendedCollection.collectionViewLayout = flowLayout
                }
                self.videoView.RecommendedCollection.reloadData()
            } else {
                portraitHeight = 230
                portraitWidth = portraitFrameHeight
                if let  flowLayout = videoView.RecommendedCollection.collectionViewLayout as? UICollectionViewFlowLayout {
                        flowLayout.scrollDirection = .horizontal
                        videoView.RecommendedCollection.collectionViewLayout = flowLayout
                }
                self.videoView.RecommendedCollection.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        loadVideo()
        setupCollection()
    }
    //MARK: - set VC layout
    func setLayout() {
        videoView.episode_label?.text = selectedVideo?.name ?? "غير متاحة"
        videoView.LikeButton?.addTarget(self, action: #selector(likePressed), for: .touchUpInside)
        
    }
    @objc func likePressed() {
        if videoView.LikeButton?.currentBackgroundImage == #imageLiteral(resourceName: "favorite_orange") {
            videoView.LikeButton?.setBackgroundImage(#imageLiteral(resourceName: "favorite_cyan"), for: .normal)
        } else {
            videoView.LikeButton?.setBackgroundImage(#imageLiteral(resourceName: "favorite_orange"), for: .normal)
        }
    }
        
} // End-Class VideoVC

