//
//  FavoriteVC.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/12/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "المفضلة"
    }
    
}
