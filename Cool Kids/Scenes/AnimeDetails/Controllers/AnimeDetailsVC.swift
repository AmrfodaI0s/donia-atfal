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
    override func viewDidLoad() {
        super.viewDidLoad()
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

