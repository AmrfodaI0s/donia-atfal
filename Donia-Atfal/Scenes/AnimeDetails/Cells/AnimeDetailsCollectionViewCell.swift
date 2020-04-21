//
//  AnimeDetailsCollectionViewCell.swift
//  Cool Kids
//
//  Created by Eslam on 3/23/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class AnimeDetailsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var anime_iv: UIImageView!
    @IBOutlet weak var title_view: UIView!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var duration_view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }

}
