//
//  VideoVC.swift
//  Cool Kids
//
//  Created by Eslam on 4/12/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    var selectedVideo: Video?
    var related_videos: Videos?
    let cell_id = "videoCell"
    @IBOutlet weak var episode_label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
    }
 
} // End-Class VideoVC

//MARK: -  Get Videos Data & Assign it to Layouts
extension VideoVC {
    //MARK: -  set layout
    func setLayout() {
        tableView.rowHeight = 112
        episode_label.text = selectedVideo?.name ?? "غير متاحة"
    }
    func configData() {
        setLayout()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: cell_id)
    }
    
}
