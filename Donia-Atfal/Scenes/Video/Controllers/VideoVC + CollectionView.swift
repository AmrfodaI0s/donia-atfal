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
    func setupCollection() {
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
            let width = self.view.frame.width
            let height = CGFloat(110)
            return CGSize(width : width , height : height)
        } else {
            let width = portraitWidth / 4
            let height = portraitHeight - 24
            return CGSize(width : width , height : height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if is_portrait == true {
            return UIEdgeInsets(top: 6, left: 0, bottom: 12, right: 0)
        } else {
            return UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
         // look for the extention   //videoView.RecommendedCollection.scroll(to: .bottom)
        }
        else {
            print("uuuuuuuuu")

        }
    }
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("9000000008")

    }
    // we set a variable to hold the contentOffSet before scroll view scrolls

    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            self.shrinkTitleView(x: 0, cons: 1)
            self.videoView.videoView?.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            self.videoView.videoView?.layer.shadowOffset = CGSize(width: 300, height: 4)
            self.videoView.videoView?.clipsToBounds = true

        } else if self.lastContentOffset > scrollView.contentOffset.y {
            print("did move down")
            self.shrinkTitleView(x: 1, cons: 109)
        } else {
            // didn't move
            print("didn't move")
            
        }
    }
    func shrinkTitleView(x: CGFloat, cons: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.infoViewHeightCons.constant = cons
            self.videoView.titleInfoView?.alpha = x
            self.view.layoutIfNeeded()
        }
    }
}
