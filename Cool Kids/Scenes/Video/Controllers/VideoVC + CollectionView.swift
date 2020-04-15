//
//  VideoVC + TableView.swift
//  Cool Kids
//
//  Created by Eslam on 4/13/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

extension VideoVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
     
    //MARK: - Setup_Collection
    func setup_Collection() {
        videoView.RecommendedCollection.delegate = self
        videoView.RecommendedCollection.dataSource = self
        videoView.RecommendedCollection.register(UINib(nibName: "VideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "videoCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if is_portrait == true {
            return related_videos?.count ?? 0
        } else {
            return related_videos?.count ?? 0
        }
    }
    
    //MARK: - Cells Sizes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if is_portrait == true {
            let width = portraitWidth
            if indexPath.row == 0 {
                let height = CGFloat(124)
                return CGSize(width : width , height : height)
            } else {
                let height = CGFloat(108)
                return CGSize(width : width , height : height)
            }
            
        } else {
            let width = portraitWidth / 4
            let height = portraitHeight - 24
            return CGSize(width : width , height : height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if is_portrait == true {
            return UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        } else {
            return UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        }
    }

}
