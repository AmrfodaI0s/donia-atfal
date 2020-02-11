//
//  MainView.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/10/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation

protocol MainView: class {
    
    func showIndictor()
    func hideIndictor()
    func fetchDataSucceffully()
    func displayError()
    func goToVC()
}
