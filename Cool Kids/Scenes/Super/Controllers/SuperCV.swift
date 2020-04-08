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


