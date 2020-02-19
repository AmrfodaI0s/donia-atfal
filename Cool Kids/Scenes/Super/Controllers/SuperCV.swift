//
//  SuperCV.swift
//  Cool Kids
//
//  Created by Eslam on 2/11/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class SuperCV: UIViewController {

    var cell_id = "silderCell"
    var imageSet: [String] = ["magna","gogo","konan"]
    
    @IBOutlet var pageController: UIPageControl!
    @IBOutlet weak var slider_collectionView: UICollectionView!
    @IBOutlet var sliderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setStatusBarColor(view: view, withColor: UIColor(red:0.21, green:0.23, blue:0.31, alpha:1.0))
        collection_setup()
        pageController.numberOfPages = imageSet.count
        pageController.currentPage = 0
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "الرئيسية"
    }
    
    //MARK: - collectionView Setup
    private func collection_setup() {
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cell_id)
    }
}

//MARK: - CollectionView
extension SuperCV: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: cell_id, for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        cell.iv.image = UIImage(named: imageSet[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.sliderCollectionView.bounds.width , height: self.sliderCollectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int( self.sliderCollectionView.contentOffset.x / self.sliderCollectionView.frame.width )
        pageController.currentPage = index
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
    
}

