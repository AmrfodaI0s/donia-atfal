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
    var categories = [Category]()
    
    @IBOutlet var MainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
        MainCollectionView.delegate = self
        MainCollectionView.dataSource = self
        MainCollectionView.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "searchCell")
        MainCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "silderCell")
        MainCollectionView.register(UINib(nibName: "AnimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "animeCell")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //getCategories()
        self.title = "الرئيسية"
        self.navigationController?.viewWillLayoutSubviews()
    }
    
    //MARK: - Theme
    private func Theme_Color() {
        DispatchQueue.main.async {
            //BackGround
            self.view.backgroundColor = Theme.current.BG_Color
            //TabBar
            self.tabBarController?.tabBar.barTintColor = Theme.current.Settings_Views
        }
    }
    
    //MARK: - Click Again on TabBar Item To Go Back Top
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selected_item = 9
        let tabBarIndex = tabBarController.selectedIndex
        if selected_item == tabBarIndex && selected_item == 2 {
            self.MainCollectionView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
}

//MARK: -  Load data from server
extension SuperCV {
    //MARK: -  get all categories using UrlSession
    func fetchCategoriesAPI() {
        Helper.showSpinner(onView: view)
        API.getAllCategories  { [weak self] (error, categories) in
            self?.categories = categories!
            DispatchQueue.main.async {
                self?.MainCollectionView.reloadData()
            }
            Helper.removeSpinner()
        }
    }
    //MARK: -  Load Categories data
    func getCategories(){
        if Reachability.isConnectedToNetwork() {
            fetchCategoriesAPI()
        } else {
            Alert.noInternetConnection(self) {
                self.getCategories()
            }
        }
    }
}

