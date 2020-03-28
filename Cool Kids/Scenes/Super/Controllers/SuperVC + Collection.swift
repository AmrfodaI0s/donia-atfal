//
//  SuperVC + Collection.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/16/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

//MARK: - CollectionView
extension SuperCV: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (categories?.count ?? 1) + 2 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = MainCollectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
            return cell
            
        } else if indexPath.row == 1 {
            guard let cell = MainCollectionView.dequeueReusableCell(withReuseIdentifier: "silderCell", for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else {
            guard let cell = MainCollectionView.dequeueReusableCell(withReuseIdentifier: "animeCell", for: indexPath) as? AnimeCollectionViewCell else { return UICollectionViewCell() }
            cell.category_label.text = self.categories?[indexPath.row - 2].name ?? ""
            cell.selected_item = { [weak self] selected in
            let DestinatioVC = UIStoryboard(name: "AnimeDetails", bundle: nil).instantiateViewController(withIdentifier: "DetailedVC") as! AnimeDetailsVC
            DestinatioVC.modalPresentationStyle = .fullScreen
            self!.present(DestinatioVC, animated: true, completion: nil)
            
        }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.MainCollectionView.bounds.width , height: 52)
        }
        else if indexPath.row == 1 {
            return CGSize(width: self.MainCollectionView.bounds.width, height: 180)
        }
        else {
            return CGSize(width: self.MainCollectionView.bounds.width, height: 280)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
    
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        let index = Int( self.sliderCollectionView.contentOffset.x / self.xx.frame.width )
    //        xx.currentPage = index
    //    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        <#code#>
    //    }
    //
    
    
}
