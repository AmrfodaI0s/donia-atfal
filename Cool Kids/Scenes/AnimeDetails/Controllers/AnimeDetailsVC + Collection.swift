//
//  AnimeDetailsVC + Collection.swift
//  Cool Kids
//
//  Created by Eslam on 3/23/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit
extension AnimeDetailsVC : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  
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
            cell.episode.text = videos?[indexPath.row].name ?? "حلقة 0"
            let time_text = Helper.getTime(time: video_Time)
            cell.durationLabel.text = String(time_text)
            let url = URL(string: videos?[indexPath.row].images?[0].image ?? "")
            cell.anime_iv.kf.setImage(with: url)
            //showCellAnimeTitle(cell: cell)
            return cell
        case 1:
            showHideAnimeCell(cell: cell, state: false)
            let url = URL(string: related_videos?[indexPath.row].images?[0].image ?? "")
            cell.anime_iv.kf.setImage(with: url)
            //hideCellAnimeTitle(cell: cell)
            return cell
        default:
            //showCellAnimeTitle(cell: cell)
            return cell
        }
    }
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
    }
    
}
