//
//  AnimeDetailsVC + Collection.swift
//  Cool Kids
//
//  Created by Eslam on 3/23/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit

extension AnimeDetailsVC : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Cells Count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentIndex = anime.segmentController?.selectedSegmentIndex
        switch segmentIndex {
        case 0:
            return videos?.count ?? 0
        case 1:
            return related_videos?.count ?? 0
        default:
            return 0
        }
    }
    //MARK: - Cell Data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "animeDetailCell", for: indexPath) as? AnimeDetailsCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 12
        let segmentIndex = anime.segmentController?.selectedSegmentIndex
        switch segmentIndex {
        case 0 :
            showHideAnimeCell(cell: cell, state: true)
            var video_Time = Float()
            if (videos?[indexPath.row].urls.count)! != 0 {
                video_Time = Float(videos?[indexPath.row].urls[0].duration ?? "1")!
            } else {
                video_Time = 0.0
            }
            cell.episode.text = videos?[indexPath.row].name ?? "غير متاح"
            let time_text = Helper.getTime(time: video_Time)
            cell.durationLabel.text = String(time_text)
            let url =  videos?[indexPath.row].images?[0].image ?? ""
            Helper.displayImage(imageView: cell.anime_iv, url: url )
            return cell
        case 1:
            showHideAnimeCell(cell: cell, state: false)
            let url = URL(string: related_videos?[indexPath.row].images?[0].image ?? "")
            cell.anime_iv.kf.setImage(with: url)
            return cell
        default:
            return cell
        }
    }
    //MARK: - Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let segmentIndex = anime.segmentController?.selectedSegmentIndex
        switch segmentIndex {
        case 0 :
            return CGSize(width: (self.anime.collectionView?.bounds.width)! - 48, height: 162)
        case 1 :
            return CGSize(width: ((self.anime.collectionView?.bounds.width)! - 60) / 2, height: 162)
        default :
            return CGSize(width: (self.anime.collectionView?.bounds.width)!
                - 48, height: 162)
        }
    }
    //MARK: - Cell Edge Insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
    }
    //MARK: - Did Select Cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "AnimeDetails", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "videoVC") as? VideoVC else {return}
        vc.modalPresentationStyle = .fullScreen

        let segmentIndex = anime.segmentController?.selectedSegmentIndex
        
        switch segmentIndex {
        case 0:
            selectVideo(vc: vc, video: videos, indexPath.row)
        case 1:
            selectVideo(vc: vc, video: related_videos, indexPath.row)
        default:
            print("err didSelect")
        }
        //
        self.present(vc, animated: true)
        //self.presentAsSheet(vc, height: view.frame.height)
    }
    
    //MARK: - Move to VideoVC using PresentationController
    @objc func presentPressed() {
        //let height = view.frame.height - 400
        presentAsSheet(VideoVC(), height: 600)
    }
    //MARK: -  define which video didSelect in which Segment 0 || 1
    func selectVideo(vc: VideoVC,video: [Video]?,_ index: Int) {
         if video?[index] != nil {
             vc.selectedVideo = video?[index]
             vc.related_videos = related_videos
         } else { return }
    }
}

