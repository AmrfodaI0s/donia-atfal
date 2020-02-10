//
//  ViewController.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/10/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var presenter: MainVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainVCPresenter(view: self)
        presenter.veiwDidLoad()
    }

}

extension MainVC: MainView {
    func showIndictor() {
        
    }
    
    func hideIndictor() {
        
    }
    
    func fetchDataSucceffully() {
        
    }
    
    func displayError() {
        
    }
    
    
}
