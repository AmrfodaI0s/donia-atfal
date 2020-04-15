//
//  AnimeDetailsVC + Layout.swift
//  Cool Kids
//
//  Created by Eslam on 4/14/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

//  Extention - set Layout & data for CollectionView Cells
extension AnimeDetailsVC {
    
    //MARK: -  configure collection view that hold all videos of segment controll
    func configureCollection() {
        anime.collectionView?.delegate = self
        anime.collectionView?.dataSource = self
        anime.collectionView?.register(UINib(nibName: "AnimeDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "animeDetailCell")
    }
    //MARK: - Resize Height of collection view to fit the scroll view
    func resizeHeight() {
        anime.collectionHeight.constant = anime.collectionView!.collectionViewLayout.collectionViewContentSize.height
        self.view.layoutIfNeeded()
    }
    
    //MARK: - Show and Hide AnimeCell Title Attributes
    func setAnimeLayoutData() {
        anime.animeTitleLabel?.text = selected_anime?.name
        anime.viewCount_label?.text = String(selected_anime?.videosViews ?? 0)
        anime.eposidesCount_label?.text = String(selected_anime?.videosCount ?? 0)
        anime.releaseDate_label?.text = String(selected_anime?.releaseDate ?? 0)
        anime.anime_iv!.kf.indicatorType = .activity
        anime.anime_iv!.kf.setImage(with: URL(string: URLs.imageRequestURL + (selected_anime?.largeImage ?? "conan")), options: [.transition(.flipFromTop(0.5))])
    }
    //MARK: -  set layout of serises cells - show & hide episode data
    func showHideAnimeCell(cell: AnimeDetailsCollectionViewCell, state: Bool){
        cell.durationLabel.isHidden = state ? false : true
        cell.title_view.isHidden = state ? false : true
        cell.episode.isHidden = state ? false : true
        cell.duration_view.isHidden = state ? false : true
    }
}
