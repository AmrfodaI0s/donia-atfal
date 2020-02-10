//
//  MainVCPresenter.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/10/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import Foundation


class MainVCPresenter {
  
    private weak var view: MainView?
    private var interactor = MainInteractor()
    
    init(view: MainView) {
        self.view = view
    }
    func veiwDidLoad() -> () {
        getData()
    }
    
    func getData() -> () {
        view?.showIndictor()
        interactor.getData()
        /* in closures
        self.view?.hideIndictor()
        guard let self = self else { return }
         * */
    }
}
