//
//  VideoView.swift
//  Cool Kids
//
//  Created by Eslam on 4/14/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
@IBDesignable
class VideoView: UIView {
    //Outlets
        @IBOutlet weak var videoView: UIView?
        @IBOutlet weak var Start_Pause: UIButton?
        @IBOutlet weak var showButton: UIButton?
        @IBOutlet weak var ForwardButton: UIButton?
        @IBOutlet weak var BackWardButton: UIButton?
        @IBOutlet weak var LikeButton: UIButton?
        @IBOutlet weak var CurrentLabel: UILabel?
        @IBOutlet weak var FullLabel: UILabel?
        @IBOutlet weak var videoSlider: UISlider?
        @IBOutlet weak var ControlsView: UIView?
        @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView?
        @IBOutlet weak var BottomView: UIView?
        @IBOutlet weak var BottomViewConstant: NSLayoutConstraint?

        @IBOutlet weak var landscapeNameLabel: UILabel?
        @IBOutlet weak var video_iv: UIImageView?
        @IBOutlet weak var episode_label: UILabel?
        @IBOutlet weak var RecommendedCollection: UICollectionView!
}
/*
 //MARK: -  Get Videos Data & Assign it to Layouts
 extension VideoVC {
     //MARK: - set VC layout
     func setLayout() {
         tableView.rowHeight = 112
         episode_label.text = selectedVideo?.name ?? "غير متاحة"
         playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
         likeButton.addTarget(self, action: #selector(likePressed), for: .touchUpInside)
         self.getThumbnailImageFromVideoUrl(url: url) { (thumbImage) in
             self.video_iv.image = thumbImage
             
         }
     }
     //MARK: - configure delegate & cell & invokes
     func configData() {
         setLayout()
         tableView.dataSource = self
         tableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: cell_id)
     }
     //MARK: - configure Video settings
     func videoConfig(state: Bool) {
         let video = AVPlayer(url: url)
         let avplayer = AVPlayerViewController()
         avplayer.player = video
         self.present(avplayer, animated: true) {
             if state {
             video.play()
             } else {
             video.pause()
             }
         }
     }
     //MARK: - get Thumbnail Image From Video's Url
     func getThumbnailImageFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
         DispatchQueue.global().async { //1
             let asset = AVAsset(url: url) //2
             let avAssetImageGenerator = AVAssetImageGenerator(asset: asset) //3
             avAssetImageGenerator.appliesPreferredTrackTransform = true //4
             let thumnailTime = CMTimeMake(value: 2, timescale: 1) //5
             do {
                 let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil) //6
                 let thumbImage = UIImage(cgImage: cgThumbImage) //7
                 DispatchQueue.main.async { //8
                     completion(thumbImage) //9
                 }
             } catch {
                 print(error.localizedDescription) //10
                 DispatchQueue.main.async {
                     completion(nil) //11
                 }
             }
         }
     }
     //MARK: - like button pressed
     @objc func likePressed() {
         likeButton.currentBackgroundImage == #imageLiteral(resourceName: "favorite_orange") ?
             likeButton.setBackgroundImage(#imageLiteral(resourceName: "favorite_cyan"), for: .normal) :
             likeButton.setBackgroundImage(#imageLiteral(resourceName: "favorite_orange"), for: .normal)
         
     }
     //MARK: - play button pressed
     @objc func playPressed(){
         if playButton.currentBackgroundImage == #imageLiteral(resourceName: "pause_white") {
             playButton.setBackgroundImage(#imageLiteral(resourceName: "play_white"), for: .normal)
             videoConfig(state: false)
         } else {
             playButton.setBackgroundImage(#imageLiteral(resourceName: "pause_white"), for: .normal)
             videoConfig(state: true)
         }
         
     }
 }

 */
