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
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame_height = (self.view.frame.size.height)
        Helper.saveUserDefaults(height: frame_height)
    }

}

extension MainVC {
    func goToVC() {
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let VC = SB.instantiateViewController(withIdentifier: "discoveryBar")
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true)
    }
    
    
        
}
