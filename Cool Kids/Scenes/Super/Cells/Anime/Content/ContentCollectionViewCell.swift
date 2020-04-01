//
//  ContentCollectionViewCell.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/17/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
import Kingfisher

class ContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func displayImage(url: String) {
        let url = URL(string: URLs.imageRequestURL + url)!
        iv.kf.indicatorType = .activity
        iv.kf.setImage(with: url, options: [.transition(.fade(0.2))])
}
//setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
}
