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
    var related_videos: Videos?
    var related_videos_count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //swipeFromRight()
        SwipeBack()
        //set attributes for the labels and Images from the fetched data
        setAnimeLayoutData()
        //configure the collection view - delegates and nib registering
        configureCollection()
        // set status bar color
        Helper.setStatusBarColor(view: view, withColor: UIColor(cgColor: #colorLiteral(red: 0.2174186409, green: 0.2404800057, blue: 0.332449615, alpha: 1)))
        
        //MARK: -  set the layout and design of {Segment Control}
        let font = UIFont.init(name: "Sukar", size: 19)
        anime.segmentController?.setTitleTextAttributes([NSAttributedString.Key.font: font ?? "",NSAttributedString.Key.foregroundColor: UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.00)], for: .normal)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        anime.segmentController?.setTitleTextAttributes(titleTextAttributes, for: .selected)
        anime.segmentController?.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        //set IBAction of the {back  arrow button}
        anime.backBtn?.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        getVideosIfConnected()
    }
    
    @objc func backBtnPressed() {
        dismissFromRight()
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
    
    override func viewWillLayoutSubviews() {
        resizeHeight()
    }
    
    
} // end class AnimeDetailsVC


//MARK: - Extention - API Fetching Methods
extension AnimeDetailsVC {
    
    //MARK: - get Videos if isConnectedToNetwork
    func getVideosIfConnected(){
        if Reachability.isConnectedToNetwork(){
            Helper.showSpinner(onView: view)
            //get all videos for selected categories
            handleVideos()
            handlRelatedVideos()
            Helper.removeSpinner()
        } else {
            Alert.noInternetConnection(self) {
                self.getVideosIfConnected()
            }
        }
    }
    
    //MARK: - get all videos by category id
    func handleVideos() {
        API.getAnimeByID(categoryID: self.selected_anime?.id ?? 80) { (error, videos) in
            self.videos = videos
            DispatchQueue.main.async {
                self.anime.collectionView?.reloadData()
            }
        }
    }
    
    //MARK: - get all related videos by category id
    func handlRelatedVideos() {
        API.getRelatedVideos(id: selected_anime?.id ?? 0) { (error, videos) in
            self.related_videos = videos
            DispatchQueue.main.async {
                self.anime.collectionView?.reloadData()
            }
        }
    }
}
//MARK: -  Extention - set Layout & data for CollectionView Cells
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
