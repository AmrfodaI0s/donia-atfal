//
//  BaseNC.swift
//  Donia-Atfal
//
//  Created by Eslam on 4/25/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation
import UIKit
class BaseNavigationController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        if let barView = self.view.viewWithTag(2222) {
            barView.removeFromSuperview()
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return self.topViewController?.supportedInterfaceOrientations ?? .all
        }
    }
    
    override var shouldAutorotate: Bool {
        get {
            return self.topViewController?.shouldAutorotate ?? false
        }
    }
    
}

