//
//  SliderPhotoCollectionViewCell.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/17/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class SliderPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var iv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        iv.layer.cornerRadius = 12
        
    }

}
