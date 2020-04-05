//
//  AnimeDetailsView.swift
//  Cool Kids
//
//  Created by Eslam on 3/29/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

@IBDesignable
class AnimeDetailsView: UIView {
    
    @IBOutlet weak var segmentController: UISegmentedControl?

    @IBOutlet weak var backBtn: UIButton?
    
    @IBOutlet weak var anime_iv: UIImageView?
    
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var animeTitleLabel: UILabel?
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    @IBOutlet weak var eposidesCount_label: UILabel?
    @IBOutlet weak var viewCount_label: UILabel?
    @IBOutlet weak var releaseDate_label: UILabel?
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var swipeableView: UIView!
    
}
