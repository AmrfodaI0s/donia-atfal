//
//  VideoTableViewCell.swift
//  Cool Kids
//
//  Created by Eslam on 4/13/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var anime_iv: UIImageView!
    @IBOutlet weak var anime_name_label: UILabel!
    @IBOutlet weak var views_count_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
    
}
