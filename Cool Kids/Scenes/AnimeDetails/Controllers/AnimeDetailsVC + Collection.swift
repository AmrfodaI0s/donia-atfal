//
//  AnimeDetailsVC + Collection.swift
//  Cool Kids
//
//  Created by Eslam on 3/23/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit
extension AnimeDetailsVC : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func configureCollection() {
        animeCollection.delegate = self
        animeCollection.dataSource = self
        animeCollection.register(UINib(nibName: "AnimeDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "animeDetailCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentIndex = segmentController.selectedSegmentIndex
        switch segmentIndex {
        case 0:
            return 4
        case 1:
            return 3
        default:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = animeCollection.dequeueReusableCell(withReuseIdentifier: "animeDetailCell", for: indexPath) as? AnimeDetailsCollectionViewCell else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 12
        let segmentIndex = segmentController.selectedSegmentIndex
        switch segmentIndex {
        case 0 :
            tryMe(cell: cell, state: true)
            //showCellAnimeTitle(cell: cell)
            return cell
        case 1:
            tryMe(cell: cell, state: false)
            //hideCellAnimeTitle(cell: cell)
            return cell
        default:
            //showCellAnimeTitle(cell: cell)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let segmentIndex = segmentController.selectedSegmentIndex
        switch segmentIndex {
        case 0 :
            return CGSize(width: self.animeCollection.bounds.width - 48, height: 162)
        case 1 :
            return CGSize(width: (self.animeCollection.bounds.width - 60) / 2, height: 162)
        default :
            return CGSize(width: self.animeCollection.bounds.width - 48, height: 162)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
    }
}
