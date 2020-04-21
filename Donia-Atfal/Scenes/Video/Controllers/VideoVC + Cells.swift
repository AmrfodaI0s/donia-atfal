//
//  VideoVC + Cells.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
import Kingfisher

extension VideoVC {
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Cell For Portrait Mode
        if is_portrait == true {
                //MARK: - Portrait Default Cells
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell_id, for: indexPath) as! VideoCollectionViewCell
                cell.anime_name_label.text = related_videos?[indexPath.row].name ?? ""
                cell.views_count_label.text = String(related_videos?[indexPath.row].views ?? 1)
                //Cell Image
                let video_image_url = related_videos?[indexPath.row].images![0].image ?? ""
                var comps = URLComponents(string: video_image_url)!
                comps.scheme = "https"
                let https = comps.string!
                let url = URL(string : https)
                cell.anime_iv.kf.setImage(with: url)
                //Cell Theme
                cell.anime_name_label.textColor = Theme.current.White_Text
                return cell
        } else {
            //MARK: - LandScape Cells
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell_id, for: indexPath) as! VideoCollectionViewCell
            cell.anime_name_label.text = related_videos?[indexPath.row].name ?? ""
            cell.views_count_label.text = String(related_videos?[indexPath.row].views ?? 0)
            //Cell Image
            let video_image_url = related_videos?[indexPath.row].images![0].image ?? ""
            var comps = URLComponents(string: video_image_url)!
            comps.scheme = "https"
            let https = comps.string!
            let url = URL(string : https)
            cell.anime_iv.kf.setImage(with: url)
            return cell
        }
    }
}
