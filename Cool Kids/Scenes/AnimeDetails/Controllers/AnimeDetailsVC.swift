//
//  AnimeDetailsVC.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/18/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class AnimeDetailsVC: UIViewController {
    
    @IBOutlet weak var anime: AnimeDetailsView!
    var selected_anime : Category?
    var videos: Videos?
    override func viewDidLoad() {
        super.viewDidLoad()
        handleVideos()
        setAnimeLayoutData()
        configureCollection()
        Helper.setStatusBarColor(view: view, withColor: UIColor(cgColor: #colorLiteral(red: 0.2174186409, green: 0.2404800057, blue: 0.332449615, alpha: 1)))
        let font = UIFont.init(name: "Sukar", size: 19)
        anime.segmentController?.setTitleTextAttributes([NSAttributedString.Key.font: font ?? "",NSAttributedString.Key.foregroundColor: UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.00)], for: .normal)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        anime.segmentController?.setTitleTextAttributes(titleTextAttributes, for: .selected)
        anime.segmentController?.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        anime.backBtn?.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
    }
    
    @objc func segmentChanged() {
        let segmentIndex = anime.segmentController?.selectedSegmentIndex
        switch segmentIndex {
        case 0 :
            anime.collectionView?.reloadData()
            resizeHeight()
        case 1 :
            anime.collectionView?.reloadData()
            resizeHeight()
        default:
            resizeHeight()
            anime.collectionView?.reloadData()
        }
    }
    
    @objc func backBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillLayoutSubviews() {
        resizeHeight()
    }
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
    //unused function
    func hideCellAnimeTitle(cell: AnimeDetailsCollectionViewCell) {
        cell.durationLabel.isHidden =  true
        cell.title_view.isHidden = true
        cell.episode.isHidden = true
        cell.duration_view.isHidden = true
    }
    //unused function
    func showCellAnimeTitle(cell: AnimeDetailsCollectionViewCell,_ indexPath: Int) {
        cell.durationLabel.isHidden =  false
        cell.title_view.isHidden = false
        cell.episode.isHidden = false
        cell.duration_view.isHidden = false
    }
    
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
    //MARK: - get all videos by category id
    func handleVideos() {
        DispatchQueue.main.async {
            AnimeDataServices.getAnimeByID(categoryID: self.selected_anime?.id ?? 80) { (error, videos) in
                self.videos = videos
                //print(self.videos)
                //print(self.videos[0].images?[0].image)
                self.anime.collectionView?.reloadData()
            }
        }
    }
    
}

