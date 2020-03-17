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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageController.numberOfPages = 3
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
        if counter < 3 {
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
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderPhotoCell", for: indexPath ) as? SliderPhotoCollectionViewCell else { return UICollectionViewCell() }
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
    
}
