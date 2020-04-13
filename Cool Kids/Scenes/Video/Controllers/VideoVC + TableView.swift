//
//  VideoVC + TableView.swift
//  Cool Kids
//
//  Created by Eslam on 4/13/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

extension VideoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return related_videos?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell_id, for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
        
        cell.anime_name_label.text = related_videos?[indexPath.row].name ?? " "
        cell.views_count_label.text = String(related_videos?[indexPath.row].views ?? 545)
        if let url = related_videos?[indexPath.row].images?[0].image {
        Helper.displayImage(imageView: cell.anime_iv,
                           url: url)
        }
        return cell
    }
}
