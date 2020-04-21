//
//  VideoCollectionViewCell.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var anime_iv: UIImageView!
    @IBOutlet weak var anime_name_label: UILabel!
    @IBOutlet weak var views_count_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
