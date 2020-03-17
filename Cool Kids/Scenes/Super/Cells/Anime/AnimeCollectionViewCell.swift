//
//  AnimeCollectionViewCell.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/17/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class AnimeCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var contentCollectionView: UICollectionView!
    
    let cell_ID = "contentCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentCollectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cell_ID)
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
    }

}
extension AnimeCollectionViewCell: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell_ID, for: indexPath)
        return cell
    }
    
  
}
