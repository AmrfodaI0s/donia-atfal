//
//  AnimeDetailsVC.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/18/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class AnimeDetailsVC: UIViewController {
    
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var animeCollection: UICollectionView!
    
    @IBOutlet weak var animeCollectionViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        Helper.setStatusBarColor(view: view, withColor: UIColor(cgColor: #colorLiteral(red: 0.2174186409, green: 0.2404800057, blue: 0.332449615, alpha: 1)))
        let font = UIFont.init(name: "Sukar", size: 19)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.font: font ?? "",NSAttributedString.Key.foregroundColor: UIColor(red:0.70, green:0.70, blue:0.70, alpha:1.00)], for: .normal)
        //
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentController.setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        let segmentIndex = segmentController.selectedSegmentIndex
        switch segmentIndex {
        case 0 :
            animeCollection.reloadData()
            resizeHeight()
        case 1 :
            animeCollection.reloadData()
            resizeHeight()
        default:
            resizeHeight()
            animeCollection.reloadData()
        }
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillLayoutSubviews() {
        print("00000000")
        resizeHeight()
    }
    //MARK: - Resize Height
    func resizeHeight() {
        animeCollectionViewHeight.constant = animeCollection.collectionViewLayout.collectionViewContentSize.height
        self.view.layoutIfNeeded()
    }
    
}
