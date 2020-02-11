//
//  ViewController.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/10/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBAction func startBtnTapped(_ sender: UIButton) {
        goToVC()
    }
    var presenter: MainVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainVCPresenter(view: self)
        presenter.veiwDidLoad()
    }

}

extension MainVC: MainView {
    func goToVC() {
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let VC = SB.instantiateViewController(withIdentifier: "discoveryBar")
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true)
    }
    
    func showIndictor() {
        
    }
    
    func hideIndictor() {
        
    }
    
    func fetchDataSucceffully() {
        
    }
    
    func displayError() {
        
    }
    
    
}
