//
//  SliderCollectionViewCell.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/19/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var pageController: UIPageControl!
    @IBOutlet var sliderCollectionView: UICollectionView!
    
    var counter = 0
    var arraaay = [#imageLiteral(resourceName: "33657") , #imageLiteral(resourceName: "magna") ,#imageLiteral(resourceName: "konan") , #imageLiteral(resourceName: "gogo")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageController.numberOfPages = arraaay.count
        pageController.isUserInteractionEnabled = false
        setupCollection()
         let _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(Slider_Timer), userInfo: nil, repeats: true)
    }
    //MARK: - CollectionView Setup
    fileprivate func setupCollection() {
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.showsHorizontalScrollIndicator = false
        sliderCollectionView.register(UINib.init(nibName: "SliderPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderPhotoCell")

    }
    
    @objc func Slider_Timer()  {
        if counter < arraaay.count {
            let index = IndexPath(item: counter, section: 0)
            sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            let index = IndexPath(item: counter, section: 0)
            sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }

}

//MARK: - CollectionView
extension SliderCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arraaay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderPhotoCell", for: indexPath ) as? SliderPhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.iv.image = arraaay[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.sliderCollectionView.bounds.width, height: self.sliderCollectionView.bounds.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == sliderCollectionView {
            let index = Int(self.sliderCollectionView.contentOffset.x / self.sliderCollectionView.frame.width)
            pageController.currentPage = index
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        counter = indexPath.row
    }
    
}
